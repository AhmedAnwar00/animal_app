import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashWordmark extends StatelessWidget {
  const SplashWordmark({super.key});

  static const double width = 133;

  @override
  Widget build(BuildContext context) {
    return Assets.splash.splashAndroid12Branding.image(
      width: width,
      fit: BoxFit.contain,
    );
  }
}
