import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class AnimalTitle extends StatelessWidget {
  const AnimalTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Add New Animal',
      style: AppStyles.otamaRegular20.copyWith(color: AppColors.primary),
    );
  }
}
