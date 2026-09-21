import 'package:animal_app/features/auth/model/user_model.dart';

class GenerateAccessTokenResponse {
  const GenerateAccessTokenResponse({
    required this.statusCode,
    required this.message,
    required this.accessToken,
    required this.user,
  });

  final int statusCode;
  final String message;
  final String accessToken;
  final UserModel user;

  factory GenerateAccessTokenResponse.fromJson(Map<String, dynamic> json) {
    return GenerateAccessTokenResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      accessToken: json['access_token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
