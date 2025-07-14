import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors/app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      textTheme: _textTheme.apply(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headlineLarge: GoogleFonts.tiltWarp(fontSize: 48, color: AppColors.black),
      headlineMedium: GoogleFonts.tiltWarp(
        fontSize: 24,
        color: AppColors.black,
      ),
      titleLarge: GoogleFonts.tiltWarp(fontSize: 32, color: AppColors.black),
      titleMedium: GoogleFonts.tiltWarp(fontSize: 24, color: AppColors.black),
      titleSmall: GoogleFonts.tiltWarp(fontSize: 22, color: AppColors.black),
      bodyLarge: GoogleFonts.roboto(fontSize: 18, color: AppColors.black),
      bodyMedium: GoogleFonts.roboto(fontSize: 16, color: AppColors.black),

      bodySmall: GoogleFonts.roboto(fontSize: 14, color: AppColors.mediumGray),
      labelSmall: GoogleFonts.roboto(fontSize: 12, color: AppColors.mediumGray),
    );
  }
}
