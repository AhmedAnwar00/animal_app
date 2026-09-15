import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      height: 93,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'Log In',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: GoogleFonts.playfairDisplay(
            fontSize: 38.211,
            height: 92.342 / 38.211,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
