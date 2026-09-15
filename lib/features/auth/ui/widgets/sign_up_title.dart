import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 93,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'Sign Up',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: AppStyles.loginTitle.copyWith(color: AppColors.black),
        ),
      ),
    );
  }
}
