import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordSubtitle extends StatelessWidget {
  const ForgetPasswordSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329,
      child: Text(
        context.l10n.forgetPasswordSubtitle,
        style: AppStyles.poppinsRegular14.copyWith(
          color: AppColors.instructionGray,
        ),
      ),
    );
  }
}
