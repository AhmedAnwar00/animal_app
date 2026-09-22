import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text(
          'Me',
          style: AppStyles.otamaRegular20.copyWith(color: AppColors.primary),
        ),
      ),
    );
  }
}
