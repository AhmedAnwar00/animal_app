import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class AnimalDeleteConfirmationDialog extends StatelessWidget {
  const AnimalDeleteConfirmationDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => const AnimalDeleteConfirmationDialog(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        context.l10n.deleteAnimal,
        style: AppStyles.urbanistSemiBold12.copyWith(color: AppColors.black),
      ),
      content: Text(
        context.l10n.deleteAnimalMessage,
        style: AppStyles.urbanistRegular12.copyWith(color: AppColors.black),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            context.l10n.cancel,
            style: AppStyles.urbanistMedium12.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            context.l10n.delete,
            style: AppStyles.urbanistMedium12.copyWith(
              color: AppColors.passwordError,
            ),
          ),
        ),
      ],
    );
  }
}
