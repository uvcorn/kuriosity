import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/utils/app_colors/app_colors.dart';

class SnackbarHelper {
  static void show({
    required String message,
    IconData icon = Icons.check_circle_outline_rounded,
    Color backgroundColor =
        AppColors.lightBlueBackground, // Light blue background
    Color textColor = Colors.black,
    Duration duration = const Duration(seconds: 2),
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    Get.rawSnackbar(
      animationDuration: const Duration(milliseconds: 500),
      messageText: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 8),
            Text(
              message,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      snackPosition: position,
      margin: const EdgeInsets.all(12),
      borderRadius: 10,
    );
  }
}
