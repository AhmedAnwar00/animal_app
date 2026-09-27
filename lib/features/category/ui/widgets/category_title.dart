import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.createNewCategory,
      style: AppStyles.otamaRegular20.copyWith(color: AppColors.primary),
    );
  }
}
