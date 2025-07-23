import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              vertical: screenHeight * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(
                      child: Text(
                        AppStrings.introduction,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(AppStrings.introductionDec1, style: textTheme.bodyMedium),
                SizedBox(height: 16),
                Text(AppStrings.introductionDec2, style: textTheme.bodyMedium),
                SizedBox(height: 24),
                Text(AppStrings.keyFeaturestitle, style: textTheme.bodyMedium),
                SizedBox(height: 12),
                _BulletPoint(text: AppStrings.keyFeatures1),
                _BulletPoint(text: AppStrings.keyFeatures2),
                _BulletPoint(text: AppStrings.keyFeatures3),
                _BulletPoint(text: AppStrings.keyFeatures4),
                _BulletPoint(text: AppStrings.keyFeatures5),
                SizedBox(height: 24),
                Text(AppStrings.thanks, style: textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 14)),
          Expanded(child: Text(text, style: textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
