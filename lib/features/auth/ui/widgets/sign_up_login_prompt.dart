import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpLoginPrompt extends StatefulWidget {
  const SignUpLoginPrompt({super.key, required this.onLogInPressed});

  final VoidCallback onLogInPressed;

  @override
  State<SignUpLoginPrompt> createState() => _SignUpLoginPromptState();
}

class _SignUpLoginPromptState extends State<SignUpLoginPrompt> {
  late final TapGestureRecognizer _logInRecognizer;

  @override
  void initState() {
    super.initState();
    _logInRecognizer = TapGestureRecognizer()..onTap = widget.onLogInPressed;
  }

  @override
  void didUpdateWidget(SignUpLoginPrompt oldWidget) {
    super.didUpdateWidget(oldWidget);
    _logInRecognizer.onTap = widget.onLogInPressed;
  }

  @override
  void dispose() {
    _logInRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 235,
      height: 36,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomCenter,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: context.l10n.haveAccount,
                style: AppStyles.poppinsMedium14.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              TextSpan(text: ' ', style: AppStyles.poppinsMedium14),
              TextSpan(
                text: context.l10n.logInLink,
                style: AppStyles.poppinsSemiBold14.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
                recognizer: _logInRecognizer,
              ),
            ],
          ),
          maxLines: 1,
          softWrap: false,
        ),
      ),
    );
  }
}
