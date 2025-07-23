import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';

class PremiumUserDetailsScreen extends StatelessWidget {
  const PremiumUserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppStrings.becomeprem,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      CustomImage(imageSrc: AppIcons.premium),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    AppStrings.premiumuserdec1,
                    style: textTheme.bodyMedium?.copyWith(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    AppStrings.premiumuserdec2,
                    style: textTheme.bodyMedium?.copyWith(),
                  ),
                  SizedBox(height: 50),
                  Text(
                    AppStrings.premiumFeatureTitle1,
                    style: textTheme.bodyMedium?.copyWith(),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.check),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          AppStrings.premiumFeature1,
                          style: textTheme.bodyMedium?.copyWith(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    AppStrings.premiumFeatureTitle2,
                    style: textTheme.bodyMedium?.copyWith(),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.check),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          AppStrings.premiumFeature2,
                          style: textTheme.bodyMedium?.copyWith(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 150),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.priceAndPaymentMethodScreen);
                      },
                      child: Text(
                        AppStrings.gotopay,
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
