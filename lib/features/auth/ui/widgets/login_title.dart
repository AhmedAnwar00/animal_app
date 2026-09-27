import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      height: 93,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          context.l10n.logIn,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: AppStyles.loginTitle.copyWith(color: AppColors.black),
        ),
      ),
    );
  }
}
