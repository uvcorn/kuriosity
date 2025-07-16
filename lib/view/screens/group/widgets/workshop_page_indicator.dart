import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';

class WorkshopPageIndicator extends StatelessWidget {
  final int totalPages;
  final double currentPageValue;

  const WorkshopPageIndicator({
    super.key,
    required this.totalPages,
    required this.currentPageValue,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalPages, (index) {
          int currentIndicatorPage = currentPageValue.round();
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
              color: currentIndicatorPage == index
                  ? AppColors.primary
                  : AppColors.lightGray,
              borderRadius: BorderRadius.circular(5.0),
            ),
          );
        }),
      ),
    );
  }
}
