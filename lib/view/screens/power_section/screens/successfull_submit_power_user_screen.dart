import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/bottom_nav_bar/bottom_nav_bar.dart';
import '../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../../../components/custom_image/custom_image.dart';

class SuccessfullSubmitPowerUserScreen extends StatelessWidget {
  const SuccessfullSubmitPowerUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.035),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      AppStrings.becomepower,
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  CustomImage(imageSrc: AppIcons.power),
                ],
              ),
              SizedBox(height: screenHeight * 0.035),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImage(
                        imageSrc: AppImages.logo,
                        size: screenWidth * 0.12,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        AppStrings.powerUserGradings,
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: screenWidth * 0.045,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      SizedBox(
                        width: double.infinity,
                        height: screenHeight * 0.06,
                        child: ElevatedButton(
                          onPressed: () {
                            final BottomNavController navcontroller =
                                Get.find<BottomNavController>();
                            navcontroller.changeIndex(0);
                            Get.offAll(() => const BottomNavBar());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.02,
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            AppStrings.backtoHome,
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: screenWidth * 0.045,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
