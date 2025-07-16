import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_image/custom_image.dart';

class CategorySelector extends StatelessWidget {
  final List<Map<String, dynamic>> topCategories;
  final int selectedTopCategoryIndex;
  final Function(int) onCategorySelected;

  const CategorySelector({
    super.key,
    required this.topCategories,
    required this.selectedTopCategoryIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(topCategories.length, (index) {
        final bool isSelected = selectedTopCategoryIndex == index;
        return GestureDetector(
          onTap: () => onCategorySelected(index),
          child: SizedBox(
            width: Get.width * 0.18,
            child: Column(
              children: [
                CustomImage(
                  imageSrc: isSelected
                      ? topCategories[index]['selectedImageSrc'] as String
                      : topCategories[index]['unselectedImageSrc'] as String,
                  size: Get.width * 0.05,
                ),
                SizedBox(height: Get.height * 0.005),
                Text(
                  topCategories[index]['label'] as String,
                  textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(
                    color: isSelected ? AppColors.black : AppColors.mediumGray,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                if (isSelected)
                  Container(
                    height: 2,
                    width: Get.width * 0.2,
                    color: AppColors.black,
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
