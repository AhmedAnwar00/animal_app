import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginSignUpPrompt extends StatefulWidget {
  const LoginSignUpPrompt({
    super.key,
    required this.onSignUpPressed,
  });

  final VoidCallback onSignUpPressed;

  @override
  State<LoginSignUpPrompt> createState() => _LoginSignUpPromptState();
}

class _LoginSignUpPromptState extends State<LoginSignUpPrompt> {
  late final TapGestureRecognizer _signUpRecognizer;

  @override
  void initState() {
    super.initState();
    _signUpRecognizer = TapGestureRecognizer()
      ..onTap = widget.onSignUpPressed;
  }

  @override
  void didUpdateWidget(LoginSignUpPrompt oldWidget) {
    super.didUpdateWidget(oldWidget);
    _signUpRecognizer.onTap = widget.onSignUpPressed;
  }

  @override
  void dispose() {
    _signUpRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 258,
      height: 36,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomCenter,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Don’t have an account?',
                style: AppStyles.poppinsMedium14.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              TextSpan(
                text: ' ',
                style: AppStyles.poppinsMedium14,
              ),
              TextSpan(
                text: 'Sign up now',
                style: AppStyles.poppinsSemiBold14.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
                recognizer: _signUpRecognizer,
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
