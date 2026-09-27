import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class OtpVerificationCancelButton extends StatelessWidget {
  const OtpVerificationCancelButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 10,
            height: 17,
            child: Assets.auth.backChevron.svg(
              width: 10,
              height: 17,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            context.l10n.cancel,
            style: AppStyles.otamaRegular20.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
