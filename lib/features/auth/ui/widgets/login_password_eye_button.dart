import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LoginPasswordEyeButton extends StatelessWidget {
  const LoginPasswordEyeButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: Assets.auth.eye.svg(
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
