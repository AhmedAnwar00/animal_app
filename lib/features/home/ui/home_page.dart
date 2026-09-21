import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text('Home', style: AppStyles.otamaRegular20),
        ),
      ),
    );
  }
}
