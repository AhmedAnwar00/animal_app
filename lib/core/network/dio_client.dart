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
        onError: _onError,
      ),
    );
  }

  static const _authRetryKey = '_authRetry';

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
      if (accessToken != null &&
          accessToken.isNotEmpty &&
          _isAccessTokenExpired(accessToken)) {
        accessToken = await _refreshAccessToken();
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

    try {
      final accessToken = await _refreshAccessToken();
      if (accessToken == null || accessToken.isEmpty) {
        handler.next(error);
        return;
      }

      options.headers['Authorization'] = 'Bearer $accessToken';
      options.extra[_authRetryKey] = true;

      final response = await dio.fetch<dynamic>(options);
      handler.resolve(response);
    } catch (_) {
      handler.next(error);
    }
  }

  bool _isPublicPath(String path) {
    final normalized = path.startsWith('http')
        ? Uri.parse(path).path
        : path;
    return _publicPaths.contains(normalized);
  }

  bool _isAuthFailure(DioException error) {
    if (error.response?.statusCode == 401) return true;

    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String &&
          message.toLowerCase().contains('invalid or expired token')) {
        return true;
      }
    }
    return false;
  }

  bool _isAccessTokenExpired(String token) {
    final exp = _jwtExpirySeconds(token);
    if (exp == null) return false;
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return exp <= now;
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
      final accessToken = data?['access_token'];
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
