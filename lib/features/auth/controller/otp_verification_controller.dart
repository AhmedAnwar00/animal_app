import 'dart:async';

import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/features/auth/model/otp_flow.dart';
import 'package:flutter/widgets.dart';

class OtpVerificationController extends ChangeNotifier {
  OtpVerificationController({this.flow = OtpFlow.forgotPassword}) {
    _startTimer();
  }

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

  String get formattedTime {
    final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  bool get canResend => secondsLeft == 0;

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

  void onCancelPressed() {
    AppRouter.pop();
  }

  void onConfirmPressed() {
    if (flow == OtpFlow.signup) {
      AppRouter.pushNamedAndRemoveUntil(AppRoutes.login);
      return;
    }
    AppRouter.pushNamed(AppRoutes.createNewPassword);
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
