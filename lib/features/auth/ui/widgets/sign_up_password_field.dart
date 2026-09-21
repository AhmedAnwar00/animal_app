import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignUpPasswordField extends StatelessWidget {
  const SignUpPasswordField({
    super.key,
    required this.label,
    required this.obscureText,
    required this.onChanged,
  });

  final String label;
  final bool obscureText;
  final ValueChanged<String> onChanged;

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
                obscureText: obscureText,
                style: AppStyles.poppinsMedium16.copyWith(
                  color: AppColors.labelGray,
                ),
                contentPadding: const EdgeInsets.fromLTRB(14, 10, 40, 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
