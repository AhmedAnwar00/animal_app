import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class LoginRememberMe extends StatelessWidget {
  const LoginRememberMe({
    super.key,
    required this.value,
    required this.onToggle,
  });

  final bool value;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      behavior: HitTestBehavior.opaque,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: value ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: value ? AppColors.primary : AppColors.fieldBorder,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: value
                  ? const Icon(Icons.check, size: 10, color: AppColors.white)
                  : null,
            ),
            const SizedBox(width: 6),
            Text(
              context.l10n.rememberMe,
              maxLines: 1,
              softWrap: false,
              style: AppStyles.poppinsMedium10.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
