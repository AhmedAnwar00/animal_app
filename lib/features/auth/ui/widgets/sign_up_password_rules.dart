import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_rule_item.dart';
import 'package:flutter/material.dart';

class SignUpPasswordRules extends StatelessWidget {
  const SignUpPasswordRules({
    super.key,
    required this.hasMinLength,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasSpecial,
    required this.hasNumber,
  });

  final bool hasMinLength;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasSpecial;
  final bool hasNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SignUpPasswordRuleItem(
            label: context.l10n.minCharacters,
            isMet: hasMinLength,
          ),
          const SizedBox(height: 6),
          SignUpPasswordRuleItem(
            label: context.l10n.oneUppercase,
            isMet: hasUppercase,
          ),
          const SizedBox(height: 6),
          SignUpPasswordRuleItem(
            label: context.l10n.oneLowercase,
            isMet: hasLowercase,
          ),
          const SizedBox(height: 6),
          SignUpPasswordRuleItem(
            label: context.l10n.oneSpecial,
            isMet: hasSpecial,
          ),
          const SizedBox(height: 6),
          SignUpPasswordRuleItem(
            label: context.l10n.oneNumber,
            isMet: hasNumber,
          ),
        ],
      ),
    );
  }
}
