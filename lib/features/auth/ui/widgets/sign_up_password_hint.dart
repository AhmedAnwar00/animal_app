import 'package:animal_app/core/l10n/l10n_extension.dart';
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
        context.l10n.passwordHint,
        style: AppStyles.poppinsSemiBold10.copyWith(
          color: AppColors.passwordError,
        ),
      ),
    );
  }
}
