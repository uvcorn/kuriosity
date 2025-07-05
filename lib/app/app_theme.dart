import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF233BEF);
  static const Color textColor = Colors.black;

  static ThemeData get lightThemeData {
    return ThemeData(
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: primaryColor),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headlineLarge: GoogleFonts.tiltWarp(fontSize: 48, color: Colors.black),
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.4,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
      ),
      titleSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
      ),
      bodyLarge: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(fontSize: 16),
      bodySmall: TextStyle(fontSize: 14, color: Colors.grey),
    );
  }
}
