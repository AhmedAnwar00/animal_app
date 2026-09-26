import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeEmptyIllustration extends StatelessWidget {
  const HomeEmptyIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.home.emptyState.svg(
      width: 105,
      height: 53.148,
    );
  }
}
