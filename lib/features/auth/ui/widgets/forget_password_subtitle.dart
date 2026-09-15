import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordSubtitle extends StatelessWidget {
  const ForgetPasswordSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329,
      child: Text(
        "Please enter the email address associated with your account, and we'll send you OTP to reset your password.",
        style: AppStyles.poppinsRegular14.copyWith(
          color: AppColors.instructionGray,
        ),
      ),
    );
  }
}
