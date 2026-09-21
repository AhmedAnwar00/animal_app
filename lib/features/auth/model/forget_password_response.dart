class ForgetPasswordResponse {
  const ForgetPasswordResponse({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;
  final String message;

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );
  }
}
