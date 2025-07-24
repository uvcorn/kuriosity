import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../open_new_workshop_screen.dart';

class TitleDescriptionFieldPair extends StatelessWidget {
  final TitleDescriptionPair pair;
  final VoidCallback onAdd;
  final VoidCallback? onRemove;
  final bool isLast;
  final double screenWidth;
  final double screenHeight;
  final TextTheme textTheme;
  final double Function(double) fontSize;

  const TitleDescriptionFieldPair({
    super.key,
    required this.pair,
    required this.onAdd,
    this.onRemove,
    required this.isLast,
    required this.screenWidth,
    required this.screenHeight,
    required this.textTheme,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Description stacked vertically in separate containers
          Expanded(
            child: Column(
              children: [
                // Title Field
                Container(
                  height: screenHeight * 0.055,
                  margin: EdgeInsets.only(bottom: screenHeight * 0.012),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    border: Border.all(color: AppColors.black),
                  ),
                  child: TextField(
                    controller: pair.titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: textTheme.bodySmall?.copyWith(
                        fontSize: fontSize(13),
                        color: AppColors.gray,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                      ),
                    ),
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: fontSize(13),
                      color: AppColors.black,
                    ),
                  ),
                ),

                // Description Field
                Container(
                  height: screenHeight * 0.055,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    border: Border.all(color: AppColors.black),
                  ),
                  child: TextField(
                    controller: pair.descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: textTheme.bodySmall?.copyWith(
                        fontSize: fontSize(13),
                        color: AppColors.gray,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                      ),
                    ),
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: fontSize(13),
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: screenWidth * 0.02),

          // Add or Remove Button
          GestureDetector(
            onTap: isLast ? onAdd : (onRemove ?? () {}),
            child: Column(
              children: [
                Icon(
                  isLast ? Icons.add_circle_outline : Icons.remove_circle,
                  size: screenWidth * 0.07,
                  color: AppColors.black,
                ),
                Text(
                  isLast ? "Add more" : "Remove",
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: fontSize(12),
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
