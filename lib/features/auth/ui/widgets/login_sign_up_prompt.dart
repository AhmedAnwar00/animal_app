import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  height: 36 / 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF828282),
                ),
              ),
              TextSpan(
                text: ' ',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  height: 36 / 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'Sign up now',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  height: 36 / 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF04332D),
                  decoration: TextDecoration.underline,
                  decorationColor: const Color(0xFF04332D),
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
