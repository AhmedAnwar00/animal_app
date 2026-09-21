import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/features/auth/model/forget_password_request.dart';
import 'package:animal_app/features/auth/model/otp_flow.dart';
import 'package:animal_app/features/auth/model/otp_verification_args.dart';
import 'package:animal_app/features/auth/service/auth_service.dart';
import 'package:flutter/foundation.dart';

class ForgetPasswordController extends ChangeNotifier {
  ForgetPasswordController(this._authService);

  final AuthService _authService;

  String email = '';
  bool isLoading = false;
  String? errorMessage;

  void updateEmail(String value) {
    email = value;
  }

  void clearError() {
    if (errorMessage == null) return;
    errorMessage = null;
  }

  void onBackPressed() {
    AppRouter.pop();
  }

  Future<void> onSendCodePressed() async {
    if (isLoading) return;

    if (email.trim().isEmpty) {
      errorMessage = 'Email is required';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _authService.forgetPassword(
        ForgetPasswordRequest(email: email.trim()),
      );

      if (response.statusCode == 200) {
        AppRouter.pushNamed(
          AppRoutes.otpVerification,
          arguments: OtpVerificationArgs(
            flow: OtpFlow.forgotPassword,
            email: email.trim(),
          ),
        );
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
