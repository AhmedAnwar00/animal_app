import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordTitle extends StatelessWidget {
  const CreateNewPasswordTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Text(
        context.l10n.createNewPassword,
        style: AppStyles.otamaRegular20.copyWith(color: AppColors.primary),
      ),
    );
  }
}
