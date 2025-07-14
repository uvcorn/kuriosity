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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: CustomAppbar(),
      ),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
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
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final screenHeight = MediaQuery.of(
                            context,
                          ).size.height;
                          final screenWidth = MediaQuery.of(context).size.width;

                          final containerHeight = screenHeight * 0.7;
                          final containerWidth = screenWidth * 0.8;
                          final topSpacing = containerHeight * 0.55;

                          return Container(
                            height: containerHeight,
                            width: containerWidth,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: topSpacing),
                                  Text(
                                    page.title,
                                    textAlign: TextAlign.start,
                                    style: textTheme.titleLarge?.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                  SizedBox(height: containerHeight * 0.06),
                                  Text(
                                    page.body,
                                    textAlign: TextAlign.start,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: size.width * 0.04),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.01,
                      ),
                      height: size.height * 0.005,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppColors.primary
                            : AppColors.backgroundLightGray,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
