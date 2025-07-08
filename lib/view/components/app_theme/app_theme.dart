import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors/app_colors.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF233BEF);
  static const Color textColor = Colors.black;
  static Color defaultTextColor = AppColors.backgroundWhite;
  static ThemeData get lightThemeData {
    return ThemeData(
      textTheme: _textTheme.apply(),
      iconTheme: IconThemeData(color: primaryColor),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headlineLarge: GoogleFonts.tiltWarp(fontSize: 48, color: AppColors.black),
      headlineMedium: GoogleFonts.tiltWarp(
        fontSize: 24,
        color: AppColors.black,
      ),
      titleLarge: GoogleFonts.tiltWarp(fontSize: 32, color: textColor),
      titleMedium: GoogleFonts.tiltWarp(fontSize: 24),
      titleSmall: GoogleFonts.tiltWarp(fontSize: 22),
      bodyLarge: GoogleFonts.roboto(fontSize: 18),
      bodyMedium: GoogleFonts.roboto(fontSize: 16, color: AppColors.black),
      bodySmall: GoogleFonts.roboto(fontSize: 14, color: AppColors.mediumGray),
      labelSmall: GoogleFonts.roboto(fontSize: 12, color: AppColors.mediumGray),
    );
  }
}
