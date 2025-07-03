import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF233BEF);

  static ThemeData get lightThemeData {
    return ThemeData(
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: primaryColor), // Primary color for icons
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
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
