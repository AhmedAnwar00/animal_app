import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class SignUpPasswordHint extends StatelessWidget {
  const SignUpPasswordHint({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Text(
        'Please add all necessary characters to create safe password.',
        style: AppStyles.poppinsSemiBold10.copyWith(
          color: AppColors.passwordError,
        ),
      ),
    );
  }
}
