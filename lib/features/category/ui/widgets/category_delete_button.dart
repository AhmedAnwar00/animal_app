import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CategoryDeleteButton extends StatelessWidget {
  const CategoryDeleteButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      height: 44,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.passwordError,
          foregroundColor: AppColors.white,
          minimumSize: const Size(342, 44),
          maximumSize: const Size(342, 44),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(10),
        ),
        child: Text(
          'Delete',
          style: AppStyles.poppinsRegular14.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
