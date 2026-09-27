import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CategoryUserHeader extends StatelessWidget {
  const CategoryUserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Assets.category.avatar.image(
            width: 37,
            height: 37,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ahmed El-said',
              style: AppStyles.urbanistSemiBold12.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            Container(
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
                    context.l10n.publicLabel,
                    style: AppStyles.urbanistRegular10.copyWith(
                      color: AppColors.public,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
