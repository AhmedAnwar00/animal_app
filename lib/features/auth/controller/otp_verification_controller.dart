import 'dart:async';

import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/features/auth/model/otp_flow.dart';
import 'package:animal_app/features/auth/model/verification_code_request.dart';
import 'package:animal_app/features/auth/service/auth_service.dart';
import 'package:flutter/widgets.dart';

class OtpVerificationController extends ChangeNotifier {
  OtpVerificationController(
    this._authService, {
    required this.email,
    this.flow = OtpFlow.forgotPassword,
  }) {
    _startTimer();
  }

  final AuthService _authService;
  final String email;
  final OtpFlow flow;

  static const int digitCount = 5;
  static const int resendSeconds = 59;

  final List<String> digits = List.filled(digitCount, '');
  final List<FocusNode> focusNodes = List.generate(
    digitCount,
    (_) => FocusNode(),
  );

  int secondsLeft = resendSeconds;
  Timer? _timer;
  bool isLoading = false;
  String? errorMessage;

  String get formattedTime {
    final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  bool get canResend => secondsLeft == 0;

  String get _code => digits.join();

  void updateDigit(int index, String value) {
    if (index < 0 || index >= digitCount) return;

    final digit = value.isEmpty ? '' : value.substring(value.length - 1);
    digits[index] = digit;

    if (digit.isNotEmpty && index < digitCount - 1) {
      focusNodes[index + 1].requestFocus();
    } else if (digit.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void clearError() {
    if (errorMessage == null) return;
    errorMessage = null;
  }

  void onCancelPressed() {
    AppRouter.pop();
  }

  Future<void> onConfirmPressed() async {
    if (isLoading) return;

    if (digits.any((digit) => digit.isEmpty)) {
      errorMessage = 'Please enter the full verification code';
      notifyListeners();
      return;
    }

    if (flow == OtpFlow.forgotPassword) {
      AppRouter.pushNamed(AppRoutes.createNewPassword);
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _authService.verifyCode(
        VerificationCodeRequest(
          email: email,
          code: _code,
        ),
      );

      if (response.statusCode == 200) {
        AppRouter.pushNamedAndRemoveUntil(AppRoutes.login);
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

  void onResendPressed() {
    if (!canResend) return;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    secondsLeft = resendSeconds;
    notifyListeners();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft <= 0) {
        timer.cancel();
        notifyListeners();
        return;
      }
      secondsLeft -= 1;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
