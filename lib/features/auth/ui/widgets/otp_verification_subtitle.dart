import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class OtpVerificationSubtitle extends StatelessWidget {
  const OtpVerificationSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329,
      child: Text(
        'Please enter the 4 digit code sent your phone number',
        style: AppStyles.poppinsRegular14.copyWith(
          color: AppColors.otpSubtitle,
        ),
      ),
    );
  }
}
