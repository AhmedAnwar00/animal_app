import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class SignUpPasswordRuleItem extends StatelessWidget {
  const SignUpPasswordRuleItem({
    super.key,
    required this.label,
    required this.isMet,
  });

  final String label;
  final bool isMet;

  @override
  Widget build(BuildContext context) {
    final color =
        isMet ? AppColors.passwordSuccess : AppColors.passwordError;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          label,
          style: AppStyles.poppinsSemiBold9.copyWith(
            color: color,
            decoration: isMet ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor: color,
          ),
        ),
      ],
    );
  }
}
