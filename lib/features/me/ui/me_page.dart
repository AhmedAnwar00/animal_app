import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/language/controller/language_controller.dart';
import 'package:animal_app/features/me/ui/widgets/me_profile_header.dart';
import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({super.key, required this.languageController});

  final LanguageController languageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: MeProfileHeader(
                onLanguagePressed: () {
                  languageController.toggle();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
