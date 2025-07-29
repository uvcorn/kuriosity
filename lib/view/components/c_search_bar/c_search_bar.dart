// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../utils/app_colors/app_colors.dart';

class CSearchbar extends StatelessWidget {
  const CSearchbar({
    super.key,
    required this.hinttext,
    this.hasBackground = false,
    this.background = AppColors.backgroundLightGray,
    this.fillcolor = AppColors.white,
  });
  final String hinttext;
  final Color background;
  final bool hasBackground;
  final Color fillcolor;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: hasBackground ? AppColors.white : background,
      height: 50,
      padding: const EdgeInsets.fromLTRB(8, 0, 16, 12),
      child: Container(
        // Keep the decoration for the overall container's shadow and border radius
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   // BoxShadow(
          //   //   color: AppColors.black.withOpacity(0.08),
          //   //   spreadRadius: 0,
          //   //   blurRadius: 10,
          //   //   offset: Offset(0, 2),
          //   // ),
          // ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: textTheme.bodySmall,
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.black,
              size: 16,
            ),
            filled: true,
            fillColor: fillcolor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none, // Removes border when enabled
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none, // Removes border when focused
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 0,
            ),
          ),
        ),
      ),
    );
  }
}
