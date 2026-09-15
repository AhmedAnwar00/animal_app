import 'package:flutter/material.dart';

class FakeHomePage extends StatelessWidget {
  const FakeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Fake Home'),
      ),
    );
  }
}
