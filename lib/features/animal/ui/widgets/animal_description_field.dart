import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class AnimalDescriptionField extends StatelessWidget {
  const AnimalDescriptionField({
    super.key,
    required this.onChanged,
    this.initialValue,
  });

  final ValueChanged<String> onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Animal Description',
            style: AppStyles.poppinsRegular16.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 339,
            height: 94,
            child: AppTextField(
              initialValue: initialValue,
              onChanged: onChanged,
              maxLines: 4,
              style: AppStyles.poppinsRegular12.copyWith(
                color: AppColors.hintGray,
              ),
              hintText: 'Enter your Description',
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
