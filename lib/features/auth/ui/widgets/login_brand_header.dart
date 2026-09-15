import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBrandHeader extends StatelessWidget {
  const LoginBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.auth.loginLogo.image(
          width: 72,
          height: 71,
          fit: BoxFit.contain,
        ),
        Text(
          'ANIMOOO',
          style: GoogleFonts.originalSurfer(
            fontSize: 11.4,
            height: 27.656 / 11.4,
            color: const Color(0xFF04332D),
          ),
        ),
      ],
    );
  }
}
