class ForgetPasswordRequest {
  const ForgetPasswordRequest({required this.email});

  final String email;

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
