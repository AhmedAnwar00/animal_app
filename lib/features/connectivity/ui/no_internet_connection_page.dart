import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/connectivity/ui/widgets/no_internet_illustration.dart';
import 'package:animal_app/features/connectivity/ui/widgets/no_internet_subtitle.dart';
import 'package:animal_app/features/connectivity/ui/widgets/no_internet_title.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionPage extends StatelessWidget {
  const NoInternetConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NoInternetIllustration(),
              SizedBox(height: 14),
              NoInternetTitle(),
              SizedBox(height: 8),
              NoInternetSubtitle(),
            ],
          ),
        ),
      ),
    );
  }
}
