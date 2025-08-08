// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../components/action_button/action_button.dart';
import '../../components/custom_image/custom_image.dart';
import 'controller/third_onboarding_controller.dart';

class ThirdOnbordingScreen extends StatelessWidget {
  const ThirdOnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThirdOnboardingController controller = Get.put(
      ThirdOnboardingController(),
    );
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,

      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 36),
            child: Row(
              children: [
                CustomImage(imageSrc: AppImages.logo, size: 24),
                const SizedBox(width: 5),
                Text(AppStrings.appTitle, style: textTheme.headlineMedium),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  final page = controller.pages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final containerHeight = size.height * 0.73;
                          final containerWidth = size.width * 0.8;

                          return Container(
                            height: containerHeight,
                            width: containerWidth,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  CustomImage(
                                    imageSrc: page.imagePath,
                                    fit: BoxFit.cover,
                                  ),

                                  Container(
                                    color: Colors.black.withOpacity(0.3),
                                  ),

                                  // Text on top
                                  Padding(
                                    padding: EdgeInsets.all(size.width * 0.05),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Spacer(),
                                        Text(
                                          page.title,
                                          style: textTheme.titleLarge?.copyWith(
                                            color: AppColors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: containerHeight * 0.06,
                                        ),
                                        Text(
                                          page.body,
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: AppColors.white,
                                          ),
                                        ),
                                        SizedBox(height: size.width * 0.18),
                                      ],
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
          SizedBox(height: size.height * 0.02),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.pages.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.01,
                        ),
                        height: size.height * 0.005,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          color: controller.currentPage == index
                              ? AppColors.primary
                              : AppColors.backgroundLightGray,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Row(
                    children: [
                      Expanded(
                        child: ActionButton(
                          title: AppStrings.backButton,
                          onPressed: controller.prevPage,
                          type: ActionButtonType.text,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Obx(
                          () => ActionButton(
                            title:
                                controller.currentPage ==
                                    controller.pages.length - 1
                                ? AppStrings.finishButton
                                : AppStrings.nextButton,
                            onPressed:
                                controller.currentPage ==
                                    controller.pages.length - 1
                                ? () => Get.toNamed(AppRoutes.signInScreen)
                                : controller.nextPage,
                            type: ActionButtonType.filled,
                          ),
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
