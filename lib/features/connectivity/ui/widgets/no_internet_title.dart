import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class NoInternetTitle extends StatelessWidget {
  const NoInternetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'No Internet Connection Found!',
      textAlign: TextAlign.center,
      style: AppStyles.urbanistMedium14.copyWith(color: AppColors.black),
    );
  }
}
