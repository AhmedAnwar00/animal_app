import 'package:animal_app/features/auth/controller/otp_verification_controller.dart';
import 'package:animal_app/features/auth/ui/widgets/otp_verification_digit_box.dart';
import 'package:flutter/material.dart';

class OtpVerificationCodeFields extends StatelessWidget {
  const OtpVerificationCodeFields({super.key, required this.controller});

  final OtpVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      height: 53,
      child: Row(
        children: [
          for (var i = 0; i < OtpVerificationController.digitCount; i++) ...[
            if (i > 0) const SizedBox(width: 18),
            OtpVerificationDigitBox(
              focusNode: controller.focusNodes[i],
              onChanged: (value) => controller.updateDigit(i, value),
            ),
          ],
        ],
      ),
    );
  }
}
