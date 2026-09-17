import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/features/auth/model/otp_flow.dart';
import 'package:animal_app/features/auth/model/otp_verification_args.dart';
import 'package:flutter/foundation.dart';

class ForgetPasswordController extends ChangeNotifier {
  String email = '';

  void updateEmail(String value) {
    email = value;
  }

  void onBackPressed() {
    AppRouter.pop();
  }

  void onSendCodePressed() {
    AppRouter.pushNamed(
      AppRoutes.otpVerification,
      arguments: OtpVerificationArgs(
        flow: OtpFlow.forgotPassword,
        email: email.trim(),
      ),
    );
  }
}
