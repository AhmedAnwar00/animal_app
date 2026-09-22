import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppStyles {
  static TextStyle get loginTitle => const TextStyle(
        fontFamily: 'Otama.ep',
        fontSize: 38.211,
        height: 92.342 / 38.211,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get otamaRegular20 => const TextStyle(
        fontFamily: 'Otama.ep',
        fontSize: 20,
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

  static TextStyle get poppinsSemiBold10 => GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get poppinsSemiBold9 => GoogleFonts.poppins(
        fontSize: 9,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get urbanistMedium16 => GoogleFonts.urbanist(
        fontSize: 16,
        height: 1.4,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      );

  static TextStyle get urbanistMedium14 => GoogleFonts.urbanist(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get urbanistRegular12 => GoogleFonts.urbanist(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get homeGreeting => GoogleFonts.originalSurfer(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get otamaRegular12 => const TextStyle(
        fontFamily: 'Otama.ep',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get urbanistSemiBold12 => GoogleFonts.urbanist(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get urbanistMedium12 => GoogleFonts.urbanist(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get plusJakartaSansMedium12 => GoogleFonts.plusJakartaSans(
        fontSize: 12,
        height: 18 / 12,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get poppinsRegular8 => GoogleFonts.poppins(
        fontSize: 8,
        fontWeight: FontWeight.w400,
      );
}
