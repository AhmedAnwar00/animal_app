import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MeLanguageButton extends StatelessWidget {
  const MeLanguageButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.public.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.category.globeAsia.svg(
              width: 10,
              height: 10,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 3),
            Text(
              context.l10n.languageName,
              style: AppStyles.urbanistRegular10.copyWith(
                color: AppColors.public,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
