// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';

class WorkshopImageCarousel extends StatelessWidget {
  final PageController pageController;
  final List<String> imageSlides;
  final double currentPageValue;
  final int totalPages;

  const WorkshopImageCarousel({
    super.key,
    required this.pageController,
    required this.imageSlides,
    required this.currentPageValue,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.35,
      width: Get.width,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: totalPages,
            itemBuilder: (context, index) {
              final diff = index - currentPageValue;
              final scale = 1.0 - (diff.abs() * 0.1);
              final offset = diff * (Get.width * 0.03);
              return Transform.scale(
                scale: scale.clamp(1, 1),
                child: Transform.translate(
                  offset: Offset(offset, 0),
                  child: CustomNetworkImage(
                    imageUrl: imageSlides[index],
                    height: Get.height * 0.35,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          if (totalPages > 1)
            Positioned(
              bottom: Get.height * 0.02,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(totalPages, (index) {
                  int currentIndicatorPage = currentPageValue.round();
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                    height: Get.width * 0.02,
                    width: Get.width * 0.02,
                    decoration: BoxDecoration(
                      color: currentIndicatorPage == index
                          ? AppColors.primary
                          : AppColors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(Get.width * 0.01),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
