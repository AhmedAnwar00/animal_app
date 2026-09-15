import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      height: 74,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Text(
              'Email',
              style: GoogleFonts.poppins(
                fontSize: 16,
                height: 24 / 16,
                color: const Color(0xFF505050),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            child: SizedBox(
              width: 339,
              height: 44,
              child: TextField(
                onChanged: onChanged,
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  height: 18 / 12,
                  color: const Color(0xFF6C6C6C),
                ),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter your email address',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    height: 18 / 12,
                    color: const Color(0xFF6C6C6C),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF6F6F6),
                  contentPadding: const EdgeInsets.fromLTRB(14, 13, 14, 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFEDEDED)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFEDEDED)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFEDEDED)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
