class SignupRequest {
  const SignupRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.imagePath,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String imagePath;
}
