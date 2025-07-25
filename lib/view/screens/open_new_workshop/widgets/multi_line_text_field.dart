import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';

class MultiLineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final double screenWidth;
  final double screenHeight;
  final TextTheme textTheme;
  final bool isMultiline;
  final TextInputAction textInputAction;

  const MultiLineTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.screenWidth,
    required this.screenHeight,
    required this.textTheme,
    this.isMultiline = true,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMultiline ? screenHeight * 0.12 : screenHeight * 0.055,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        border: Border.all(color: AppColors.black),
      ),
      child: TextField(
        controller: controller,
        maxLines: isMultiline ? null : 1,
        textInputAction: textInputAction,
        expands: isMultiline,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textTheme.bodySmall?.copyWith(color: AppColors.gray),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(screenWidth * 0.03),
        ),
        style: textTheme.bodySmall?.copyWith(color: AppColors.black),
      ),
    );
  }
}
