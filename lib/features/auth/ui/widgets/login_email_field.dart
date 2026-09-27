import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key, required this.onChanged});

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
              context.l10n.email,
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
                keyboardType: TextInputType.emailAddress,
                style: AppStyles.poppinsRegular12.copyWith(
                  color: AppColors.hintGray,
                ),
                hintText: context.l10n.enterEmail,
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
