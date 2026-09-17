import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/auth/model/signup_request.dart';
import 'package:animal_app/features/auth/model/signup_response.dart';
import 'package:animal_app/features/auth/model/verification_code_request.dart';
import 'package:animal_app/features/auth/model/verification_code_response.dart';
import 'package:dio/dio.dart';

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

  String _messageFromDioException(DioException e, String fallback) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
    }
    return e.message ?? fallback;
  }
}
