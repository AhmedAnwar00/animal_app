import 'package:animal_app/features/splash/controllers/splash_controller.dart';
import 'package:animal_app/features/splash/ui/widgets/splash_logo.dart';
import 'package:animal_app/features/splash/ui/widgets/splash_wordmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.controller,
  });

  final SplashController controller;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SplashLogo(),
            SizedBox(height: 12),
            SplashWordmark(),
          ],
        ),
      ),
    );
  }
}
