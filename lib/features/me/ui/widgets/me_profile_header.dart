import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/features/me/ui/widgets/me_language_button.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MeProfileHeader extends StatelessWidget {
  const MeProfileHeader({super.key, required this.onLanguagePressed});

  final VoidCallback onLanguagePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Assets.category.avatar.image(
            width: 96,
            height: 96,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 6),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ahmed El-said',
              style: AppStyles.urbanistSemiBold28.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            MeLanguageButton(onPressed: onLanguagePressed),
          ],
        ),
      ],
    );
  }
}
