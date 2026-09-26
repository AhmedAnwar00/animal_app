import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class HomeEmptySubtitle extends StatelessWidget {
  const HomeEmptySubtitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppStyles.urbanistRegular12.copyWith(color: AppColors.black),
    );
  }
}
