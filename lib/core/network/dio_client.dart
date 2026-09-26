import 'dart:async';
import 'dart:convert';

import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/core/storage/token_storage.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient([TokenStorage? tokenStorage])
      : _tokenStorage = tokenStorage ?? TokenStorage(),
        dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ),
        _refreshDio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  static const _authRetryKey = '_authRetry';
  static const _expiryLeewaySeconds = 30;

  static const _publicPaths = {
    ApiConstants.signup,
    ApiConstants.verificationCode,
    ApiConstants.login,
    ApiConstants.forgetPassword,
    ApiConstants.createNewPassword,
    ApiConstants.generateAccessToken,
  };

  final TokenStorage _tokenStorage;
  final Dio dio;
  final Dio _refreshDio;

  Completer<String?>? _refreshCompleter;

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      if (_isPublicPath(options.path)) {
        handler.next(options);
        return;
      }

      var accessToken = await _tokenStorage.readAccessToken();
      final needsRefresh = accessToken == null ||
          accessToken.isEmpty ||
          _isAccessTokenExpired(accessToken);

      if (needsRefresh) {
        final refreshed = await _refreshAccessToken();
        if (refreshed != null && refreshed.isNotEmpty) {
          accessToken = refreshed;
        }
      }

      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }

      handler.next(options);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: e,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  Future<void> _onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    final options = response.requestOptions;

    if (options.extra[_authRetryKey] == true ||
        _isPublicPath(options.path) ||
        !_isAuthFailureData(response.data)) {
      handler.next(response);
      return;
    }

    final retried = await _retryAfterRefresh(options);
    if (retried != null) {
      handler.resolve(retried);
      return;
    }

    handler.next(response);
  }

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    final options = error.requestOptions;

    if (options.extra[_authRetryKey] == true ||
        _isPublicPath(options.path) ||
        !_isAuthFailure(error)) {
      handler.next(error);
      return;
    }

    final retried = await _retryAfterRefresh(options);
    if (retried != null) {
      handler.resolve(retried);
      return;
    }

    handler.next(error);
  }

  Future<Response<dynamic>?> _retryAfterRefresh(
    RequestOptions options,
  ) async {
    try {
      final accessToken = await _refreshAccessToken();
      if (accessToken == null || accessToken.isEmpty) {
        return null;
      }

      final retryOptions = options.copyWith(
        headers: Map<String, dynamic>.from(options.headers)
          ..['Authorization'] = 'Bearer $accessToken',
        extra: Map<String, dynamic>.from(options.extra)
          ..[_authRetryKey] = true,
        data: _cloneRequestData(options.data),
      );

      return await dio.fetch<dynamic>(retryOptions);
    } catch (_) {
      return null;
    }
  }

  dynamic _cloneRequestData(dynamic data) {
    if (data is FormData) {
      return data.clone();
    }
    return data;
  }

  bool _isPublicPath(String path) {
    final normalized =
        path.startsWith('http') ? Uri.parse(path).path : path;
    return _publicPaths.contains(normalized);
  }

  bool _isAuthFailure(DioException error) {
    final statusCode = error.response?.statusCode;
    if (statusCode == 401 || statusCode == 403) return true;
    return _isAuthFailureData(error.response?.data);
  }

  bool _isAuthFailureData(dynamic data) {
    final map = _asStringKeyMap(data);
    if (map == null) return false;

    final statusCode = map['statusCode'];
    if (statusCode == 401 || statusCode == 403) return true;

    final message = map['message'];
    if (message is String &&
        message.toLowerCase().contains('invalid or expired token')) {
      return true;
    }
    return false;
  }

  Map<String, dynamic>? _asStringKeyMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) {
      return data.map((key, value) => MapEntry(key.toString(), value));
    }
    if (data is String && data.isNotEmpty) {
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map<String, dynamic>) return decoded;
        if (decoded is Map) {
          return decoded.map(
            (key, value) => MapEntry(key.toString(), value),
          );
        }
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  bool _isAccessTokenExpired(String token) {
    final exp = _jwtExpirySeconds(token);
    if (exp == null) return false;
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return exp <= now + _expiryLeewaySeconds;
  }

  int? _jwtExpirySeconds(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final normalized = base64Url.normalize(parts[1]);
      final payload =
          jsonDecode(utf8.decode(base64Url.decode(normalized)))
              as Map<String, dynamic>;
      final exp = payload['exp'];
      if (exp is int) return exp;
      if (exp is num) return exp.toInt();
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<String?> _refreshAccessToken() async {
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    final completer = Completer<String?>();
    _refreshCompleter = completer;

    try {
      final refreshToken = await _tokenStorage.readRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        completer.complete(null);
        return null;
      }

      final response = await _refreshDio.post<Map<String, dynamic>>(
        ApiConstants.generateAccessToken,
        options: Options(headers: {'refresh_token': refreshToken}),
      );

      final data = response.data;
      if (data == null) {
        completer.complete(null);
        return null;
      }

      final statusCode = data['statusCode'];
      final accessToken = data['access_token'];
      if (statusCode != null && statusCode != 200) {
        completer.complete(null);
        return null;
      }
      if (accessToken is! String || accessToken.isEmpty) {
        completer.complete(null);
        return null;
      }

      await _tokenStorage.saveAccessToken(accessToken);
      completer.complete(accessToken);
      return accessToken;
    } catch (_) {
      completer.complete(null);
      return null;
    } finally {
      _refreshCompleter = null;
    }
  }
}
