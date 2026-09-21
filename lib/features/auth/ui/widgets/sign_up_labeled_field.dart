import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignUpLabeledField extends StatelessWidget {
  const SignUpLabeledField({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
    this.keyboardType,
  });

  final String label;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      height: 74,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Text(
              label,
              style: AppStyles.poppinsRegular16.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            child: SizedBox(
              width: 339,
              height: 44,
              child: AppTextField(
                onChanged: onChanged,
                keyboardType: keyboardType,
                style: AppStyles.poppinsRegular12.copyWith(
                  color: AppColors.hintGray,
                ),
                hintText: hintText,
                hintStyle: AppStyles.poppinsRegular12.copyWith(
                  color: AppColors.hintGray,
                ),
                contentPadding: const EdgeInsets.fromLTRB(14, 13, 14, 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
