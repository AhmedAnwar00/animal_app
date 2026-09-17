import 'package:animal_app/features/auth/model/user_model.dart';

class SignupResponse {
  const SignupResponse({
    required this.statusCode,
    required this.message,
    required this.alert,
    required this.user,
  });

  final int statusCode;
  final String message;
  final String alert;
  final UserModel user;

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      alert: json['alert'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
