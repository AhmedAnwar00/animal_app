import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBrandHeader extends StatelessWidget {
  const LoginBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 92.85,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Assets.auth.loginLogo.image(
              width: 72,
              height: 70.57,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 64.85,
            left: 0,
            right: 0,
            child: Text(
              'ANIMOOO',
              textAlign: TextAlign.center,
              style: GoogleFonts.originalSurfer(
                fontSize: 11.444,
                height: 27.656 / 11.444,
                color: const Color(0xFF04332D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
