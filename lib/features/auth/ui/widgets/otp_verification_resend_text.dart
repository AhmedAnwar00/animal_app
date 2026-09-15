import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class OtpVerificationResendText extends StatelessWidget {
  const OtpVerificationResendText({
    super.key,
    required this.canResend,
    required this.formattedTime,
    required this.onResendPressed,
  });

  final bool canResend;
  final String formattedTime;
  final VoidCallback onResendPressed;

  @override
  Widget build(BuildContext context) {
    final label = canResend
        ? 'Resend Code'
        : 'Resend Code In $formattedTime';

    return GestureDetector(
      onTap: canResend ? onResendPressed : null,
      behavior: HitTestBehavior.opaque,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: AppStyles.poppinsRegular12.copyWith(
          color: AppColors.otpResend,
        ),
      ),
    );
  }
}
