import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPrimaryButton extends StatelessWidget {
  const LoginPrimaryButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      height: 44,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF04332D),
          foregroundColor: Colors.white,
          minimumSize: const Size(342, 44),
          maximumSize: const Size(342, 44),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(10),
        ),
        child: Text(
          'Log In',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
