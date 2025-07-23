import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';

class PremiumUserDetailsScreen extends StatelessWidget {
  const PremiumUserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      AppStrings.becomeprem,
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  CustomImage(imageSrc: AppIcons.premium),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(AppStrings.premiumuserdec1, style: textTheme.bodyMedium),
              SizedBox(height: screenHeight * 0.02),
              Text(AppStrings.premiumuserdec2, style: textTheme.bodyMedium),
              SizedBox(height: screenHeight * 0.06),
              Text(
                AppStrings.premiumFeatureTitle1,
                style: textTheme.bodyMedium,
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Icon(Icons.check, size: screenWidth * 0.05),
                  SizedBox(width: screenWidth * 0.025),
                  Expanded(
                    child: Text(
                      AppStrings.premiumFeature1,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                AppStrings.premiumFeatureTitle2,
                style: textTheme.bodyMedium,
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Icon(Icons.check, size: screenWidth * 0.05),
                  SizedBox(width: screenWidth * 0.025),
                  Expanded(
                    child: Text(
                      AppStrings.premiumFeature2,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.15),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.priceAndPaymentMethodScreen);
                  },
                  child: Text(
                    AppStrings.gotopay,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.04,
                    ),
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
