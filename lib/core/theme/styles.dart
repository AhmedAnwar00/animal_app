import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppStyles {
  static TextStyle get loginTitle => const TextStyle(
        fontFamily: 'Otama.ep',
        fontSize: 38.211,
        height: 92.342 / 38.211,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get brandMark => GoogleFonts.originalSurfer(
        fontSize: 11.444,
        height: 27.656 / 11.444,
      );

  static TextStyle get poppinsRegular14 => GoogleFonts.poppins(
        fontSize: 14,
      );

  static TextStyle get poppinsMedium10 => GoogleFonts.poppins(
        fontSize: 10,
        height: 36 / 10,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get poppinsMedium14 => GoogleFonts.poppins(
        fontSize: 14,
        height: 36 / 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get poppinsSemiBold14 => GoogleFonts.poppins(
        fontSize: 14,
        height: 36 / 14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get poppinsRegular16 => GoogleFonts.poppins(
        fontSize: 16,
        height: 24 / 16,
      );

  static TextStyle get poppinsMedium16 => GoogleFonts.poppins(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get poppinsRegular12 => GoogleFonts.poppins(
        fontSize: 12,
        height: 18 / 12,
      );
}
