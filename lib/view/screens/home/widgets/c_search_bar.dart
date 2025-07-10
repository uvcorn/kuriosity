// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';

class CSearchbar extends StatelessWidget {
  const CSearchbar({super.key, required this.hinttext});
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: AppColors.backgroundLightGray,
      height: 50,
      padding: const EdgeInsets.fromLTRB(8, 0, 16, 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
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
