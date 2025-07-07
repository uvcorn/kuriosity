import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/action_button/action_button.dart';
import '../../components/custom_appbar/coustom_appbar.dart';

class _OnboardPageData {
  final String title;
  final String body;

  _OnboardPageData({required this.title, required this.body});
}

class ThirdOnbordingScreen extends StatefulWidget {
  const ThirdOnbordingScreen({super.key});

  @override
  State<ThirdOnbordingScreen> createState() => _ThirdOnbordingScreenState();
}

class _ThirdOnbordingScreenState extends State<ThirdOnbordingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<_OnboardPageData> _pages = [
    _OnboardPageData(
      title: AppStrings.onboardingStep1Title,
      body: AppStrings.onboardingStep1Body,
    ),
    _OnboardPageData(
      title: AppStrings.onboardingStep2Title,
      body: AppStrings.onboardingStep2Body,
    ),
    _OnboardPageData(
      title: AppStrings.onboardingStep3Title,
      body: AppStrings.onboardingStep3Body,
    ),
  ];
  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: CustomAppbar(),
      ),
      body: Column(
        children: [
          SizedBox(height: 45),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 550,
                        width: 328,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 33),
                          child: Column(
                            children: [
                              const SizedBox(height: 311),
                              Text(
                                page.title,
                                style: textTheme.titleLarge!.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 35),
                              Text(
                                page.body,
                                style: textTheme.bodyMedium!.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 34),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 4,
                      width: 121,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppColors.primary
                            : AppColors.backgroundLightGray,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ActionButton(
                          title: AppStrings.backButton,
                          onPressed: _prevPage,
                          type: ActionButtonType.text,
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: ActionButton(
                          title: _currentPage == _pages.length - 1
                              ? AppStrings.finishButton
                              : AppStrings.nextButton,
                          onPressed: _currentPage == _pages.length - 1
                              ? () =>
                                    Get.offAllNamed(AppRoutes.phoneInputScreen)
                              : _nextPage,
                          type: ActionButtonType.filled,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
