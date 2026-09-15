import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  static const double width = 151;
  static const double height = 148;

  @override
  Widget build(BuildContext context) {
    return Assets.splash.splashAndroid12Logo.image(
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
