import 'package:animal_app/features/auth/model/user_model.dart';

class VerificationCodeResponse {
  const VerificationCodeResponse({
    required this.statusCode,
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  final int statusCode;
  final String message;
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  factory VerificationCodeResponse.fromJson(Map<String, dynamic> json) {
    return VerificationCodeResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
