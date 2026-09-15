import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForgetPasswordLink extends StatelessWidget {
  const LoginForgetPasswordLink({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 99,
      height: 36,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: onPressed,
          behavior: HitTestBehavior.opaque,
          child: Text(
            'Forget Password....?',
            maxLines: 1,
            softWrap: false,
            style: GoogleFonts.poppins(
              fontSize: 10,
              height: 36 / 10,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF04332D),
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xFF04332D),
            ),
          ),
        ),
      ),
    );
  }
}
