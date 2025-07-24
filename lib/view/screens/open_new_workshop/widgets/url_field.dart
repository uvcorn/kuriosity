import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';

class UrlField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final bool isLast;
  final double screenWidth;
  final double screenHeight;
  final TextTheme textTheme;

  const UrlField({
    super.key,
    required this.controller,
    required this.hint,
    required this.onAdd,
    required this.onRemove,
    required this.isLast,
    required this.screenWidth,
    required this.screenHeight,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.012),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: screenHeight * 0.055,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                border: Border.all(color: AppColors.black),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: textTheme.bodySmall?.copyWith(
                    color: AppColors.gray,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.01,
                  ),
                ),
                style: textTheme.bodySmall?.copyWith(color: AppColors.black),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          GestureDetector(
            onTap: isLast ? onAdd : onRemove,
            child: Icon(
              isLast ? Icons.add_circle_outline : Icons.remove_circle,
              color: AppColors.black,
              size: screenWidth * 0.07,
            ),
          ),
        ],
      ),
    );
  }
}
