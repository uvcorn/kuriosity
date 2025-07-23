import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_strings/app_strings.dart';

class OnboardPageData {
  final String title;
  final String body;

  OnboardPageData({required this.title, required this.body});
}

class ThirdOnboardingController extends GetxController {
  final RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;
  set currentPage(int value) => _currentPage.value = value;
  late PageController pageController;

  final List<OnboardPageData> pages = [
    OnboardPageData(
      title: AppStrings.onboardingStep1Title,
      body: AppStrings.onboardingStep1Body,
    ),
    OnboardPageData(
      title: AppStrings.onboardingStep2Title,
      body: AppStrings.onboardingStep2Body,
    ),
    OnboardPageData(
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
