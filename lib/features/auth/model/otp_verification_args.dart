import 'package:animal_app/features/auth/model/otp_flow.dart';

class OtpVerificationArgs {
  const OtpVerificationArgs({
    required this.flow,
    required this.email,
  });

  final OtpFlow flow;
  final String email;
}
