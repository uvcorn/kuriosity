import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';

class PowerUserDetailsScreen extends StatelessWidget {
  const PowerUserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Function to scale font size relative to screen width (base 375)
    double fontSize(double size) => size * screenWidth / 375;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          // Added scroll to handle small screens
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.064,
            ), // ~24px on 375 width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.04), // ~30px on 750 height
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        AppStrings.becomepower,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: fontSize(20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.021), // ~8px
                    const CustomImage(imageSrc: AppIcons.power),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04), // 30px
                Text(
                  AppStrings.poweruserdec1,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize(14),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: screenHeight * 0.027), // 20px
                Text(
                  AppStrings.poweruserdec2,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize(14),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: screenHeight * 0.067), // 50px
                Text(
                  AppStrings.premiumFeatureTitle1,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04), // 30px
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check, size: fontSize(20)),
                      SizedBox(width: screenWidth * 0.027), // 10px
                      Expanded(
                        child: Text(
                          AppStrings.premiumFeature1,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: fontSize(14),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.053), // 40px
                Text(
                  AppStrings.premiumFeatureTitle2,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04), // 30px
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check, size: fontSize(20)),
                      SizedBox(width: screenWidth * 0.027), // 10px
                      Expanded(
                        child: Text(
                          AppStrings.poweruserFeature2,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: fontSize(14),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.2), // 150px
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.058, // ~44px
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.registrationPowerUserScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                    ),
                    child: Text(
                      AppStrings.startRegistration,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: fontSize(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
