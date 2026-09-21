import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class NoInternetSubtitle extends StatelessWidget {
  const NoInternetSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 301,
      child: Text(
        'Unable to connect to the internet. Please check your connection and try again.',
        textAlign: TextAlign.center,
        style: AppStyles.urbanistRegular12.copyWith(color: AppColors.black),
      ),
    );
  }
}
