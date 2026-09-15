import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordTitle extends StatelessWidget {
  const ForgetPasswordTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Text(
        'Forget Your Password ?',
        style: AppStyles.otamaRegular20.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
