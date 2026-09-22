import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class CategoryLabeledField extends StatelessWidget {
  const CategoryLabeledField({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
  });

  final String label;
  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppStyles.poppinsRegular16.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 339,
            height: 44,
            child: AppTextField(
              onChanged: onChanged,
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
        ],
      ),
    );
  }
}
