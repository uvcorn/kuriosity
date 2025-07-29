import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';

class CustomCheckboxChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final TextTheme textTheme;
  final double screenWidth;

  const CustomCheckboxChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
    required this.textTheme,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(!isSelected);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.03,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundLightGray,
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.black,
            width: 1.0, // Border width
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: screenWidth * 0.05,
              height: screenWidth * 0.05,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.backgroundLightGray,
                borderRadius: BorderRadius.circular(screenWidth * 0.005),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.black,
                  width: 1.0,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: screenWidth * 0.04,
                      color: AppColors.white,
                    )
                  : null,
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              label,
              style: textTheme.bodySmall?.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
