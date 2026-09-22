import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Assets.home.logo.image(
            width: 64,
            height: 63,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Text(
              'Hello in ANIMOOO',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.homeGreeting.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
