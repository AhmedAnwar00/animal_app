import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/auth/model/create_new_password_request.dart';
import 'package:animal_app/features/auth/model/create_new_password_response.dart';
import 'package:animal_app/features/auth/model/forget_password_request.dart';
import 'package:animal_app/features/auth/model/forget_password_response.dart';
import 'package:animal_app/features/auth/model/generate_access_token_response.dart';
import 'package:animal_app/features/auth/model/login_request.dart';
import 'package:animal_app/features/auth/model/login_response.dart';
import 'package:animal_app/features/auth/model/signup_request.dart';
import 'package:animal_app/features/auth/model/signup_response.dart';
import 'package:animal_app/features/auth/model/verification_code_request.dart';
import 'package:animal_app/features/auth/model/verification_code_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  AuthService(this._client);

  final DioClient _client;

  Future<SignupResponse> signup(SignupRequest request) async {
    try {
      final fileName = request.imagePath.split(RegExp(r'[\\/]')).last;
      final formData = FormData.fromMap({
        'firstName': request.firstName,
        'lastName': request.lastName,
        'email': request.email,
        'phone': request.phone,
        'password': request.password,
        'image': await MultipartFile.fromFile(
          request.imagePath,
          filename: fileName,
        ),
      });

      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.signup,
        data: formData,
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return SignupResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(_messageFromDioException(e, 'Signup failed. Please try again.'));
    }
  }

  Future<VerificationCodeResponse> verifyCode(
    VerificationCodeRequest request,
  ) async {
    try {
      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.verificationCode,
        data: request.toJson(),
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return VerificationCodeResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(e, 'Verification failed. Please try again.'),
      );
    }
  }

  Future<ForgetPasswordResponse> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    try {
      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.forgetPassword,
        data: request.toJson(),
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return ForgetPasswordResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(
          e,
          'Failed to send reset email. Please try again.',
        ),
      );
    }
  }

  Future<CreateNewPasswordResponse> createNewPassword(
    CreateNewPasswordRequest request,
  ) async {
    try {
      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.createNewPassword,
        data: request.toJson(),
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return CreateNewPasswordResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(
          e,
          'Failed to update password. Please try again.',
        ),
      );
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    final baseUrl = _client.dio.options.baseUrl;
    final path = ApiConstants.login;
    debugPrint('[LOGIN DEBUG] 3 AuthService.login start');
    debugPrint('[LOGIN DEBUG] 3 POST $baseUrl$path');
    debugPrint('[LOGIN DEBUG] 3 body=${request.toJson()}');
    try {
      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.login,
        data: request.toJson(),
      );
      debugPrint(
        '[LOGIN DEBUG] 3 Dio response status=${response.statusCode} data=${response.data}',
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return LoginResponse.fromJson(data);
    } on DioException catch (e) {
      debugPrint('[LOGIN DEBUG] 3 DioException type=${e.type}');
      debugPrint('[LOGIN DEBUG] 3 requestUrl=${e.requestOptions.uri}');
      debugPrint('[LOGIN DEBUG] 3 statusCode=${e.response?.statusCode}');
      debugPrint('[LOGIN DEBUG] 3 statusMessage=${e.response?.statusMessage}');
      debugPrint('[LOGIN DEBUG] 3 responseData=${e.response?.data}');
      debugPrint('[LOGIN DEBUG] 3 dioMessage=${e.message}');
      final mapped = _messageFromDioException(
        e,
        'Login failed. Please try again.',
      );
      debugPrint('[LOGIN DEBUG] 3 mapped errorMessage="$mapped"');
      throw Exception(mapped);
    }
  }

  Future<GenerateAccessTokenResponse> generateAccessToken(
    String refreshToken,
  ) async {
    try {
      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.generateAccessToken,
        options: Options(headers: {'refresh_token': refreshToken}),
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return GenerateAccessTokenResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(
          e,
          'Failed to refresh access token. Please try again.',
        ),
      );
    }
  }

  String _messageFromDioException(DioException e, String fallback) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }

      final error = data['error'];
      if (error is List) {
        final parts = error
            .whereType<String>()
            .where((item) => item.isNotEmpty)
            .toList();
        if (parts.isNotEmpty) {
          return parts.join(', ');
        }
      }
    }
    return e.message ?? fallback;
  }
}
