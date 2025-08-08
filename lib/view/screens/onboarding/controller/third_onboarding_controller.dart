import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/utils/app_images/app_images.dart';

import '../../../../utils/app_strings/app_strings.dart';

class OnboardPageData {
  final String title;
  final String body;
  final String imagePath;

  OnboardPageData({
    required this.title,
    required this.body,
    required this.imagePath,
  });
}

class ThirdOnboardingController extends GetxController {
  final RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;
  set currentPage(int value) => _currentPage.value = value;
  late PageController pageController;

  final List<OnboardPageData> pages = [
    OnboardPageData(
      imagePath: AppImages.o1,
      title: AppStrings.onboardingStep1Title,
      body: AppStrings.onboardingStep1Body,
    ),
    OnboardPageData(
      imagePath: AppImages.o2,
      title: AppStrings.onboardingStep2Title,
      body: AppStrings.onboardingStep2Body,
    ),
    OnboardPageData(
      imagePath: AppImages.o3,
      title: AppStrings.onboardingStep3Title,
      body: AppStrings.onboardingStep3Body,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void nextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void prevPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPageChanged(int index) {
    currentPage = index;
  }
}
