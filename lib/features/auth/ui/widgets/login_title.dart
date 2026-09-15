import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Log In',
      textAlign: TextAlign.center,
      style: GoogleFonts.playfairDisplay(
        fontSize: 38.2,
        height: 92.342 / 38.2,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
