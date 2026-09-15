import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LoginBrandHeader extends StatelessWidget {
  const LoginBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 92.85,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Assets.auth.loginLogo.image(
              width: 72,
              height: 70.57,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 64.85,
            left: 0,
            right: 0,
            child: Text(
              'ANIMOOO',
              textAlign: TextAlign.center,
              style: AppStyles.brandMark.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
