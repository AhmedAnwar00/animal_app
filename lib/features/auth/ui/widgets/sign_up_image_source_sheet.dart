import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

enum SignUpImageSource { gallery, camera, cancel }

class SignUpImageSourceSheet extends StatelessWidget {
  const SignUpImageSourceSheet({super.key});

  static Future<SignUpImageSource?> show(BuildContext context) {
    return showModalBottomSheet<SignUpImageSource>(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const SignUpImageSourceSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final optionStyle = AppStyles.poppinsMedium16.copyWith(
      color: AppColors.primary,
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context, SignUpImageSource.gallery),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: Center(
                  child: Text('Photo Gallery', style: optionStyle),
                ),
              ),
            ),
            const Divider(height: 1, color: AppColors.fieldBorder),
            InkWell(
              onTap: () => Navigator.pop(context, SignUpImageSource.camera),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: Center(
                  child: Text('Camera', style: optionStyle),
                ),
              ),
            ),
            const Divider(height: 1, color: AppColors.fieldBorder),
            InkWell(
              onTap: () => Navigator.pop(context, SignUpImageSource.cancel),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: Center(
                  child: Text('Cancel', style: optionStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
