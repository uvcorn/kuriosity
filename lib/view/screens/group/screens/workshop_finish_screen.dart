import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';

class WorkshopFinishScreen extends StatelessWidget {
  const WorkshopFinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Text(
              'Congratulation!',
              style: textTheme.bodyLarge?.copyWith(fontSize: 20),
            ),
            CustomImage(imageSrc: AppIcons.rocket, size: 70),
            Text(
              'You finish the workshop',
              style: textTheme.bodyMedium?.copyWith(),
            ),
            Text(
              'Switch to a climate-healthy diet \nwith a professional nutritionist',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.submitReviewScreen);
              },
              child: Container(
                height: 45,
                width: 300,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  AppStrings.nextButton,
                  style: textTheme.bodySmall?.copyWith(color: AppColors.white),
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
