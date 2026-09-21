import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class NoInternetIllustration extends StatelessWidget {
  const NoInternetIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.connectivity.noInternetRobot.svg(
      width: 212,
      height: 227,
    );
  }
}
