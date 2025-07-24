import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
              // vertical: screenHeight * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(
                      child: Text(
                        AppStrings.privacyPolicy,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    // vertical: screenHeight * 0.025,
                  ),
                  child: Text(
                    AppStrings.privacyPolicydesc,
                    style: textTheme.bodyMedium,
                  ),
                ),
                // SizedBox(height: 16),
                // Text(
                //   'When you create an account, we collect basic information such as your name, email address, and any profile details you provide. We also collect content you share, including posts, photos, and videos. To improve your experience, we may gather usage data like app activity and device information.',
                //   style: textTheme.bodyMedium,
                // ),
                // SizedBox(height: 16),
                // Text(
                //   'Your information is used to personalize the app, facilitate social interactions, and manage events and workshops. We do not sell or rent your personal data to third parties. However, we may share necessary data with trusted service providers who help us operate the app, always under strict confidentiality.',
                //   style: textTheme.bodyMedium,
                // ),
                // SizedBox(height: 24),
                // Text(
                //   "We implement industry-standard security measures to protect your data, but no system is completely secure. You are responsible for keeping your login credentials confidential. You have the right to access, update, or delete your personal information. You can also control what content you share publicly within the app.",
                //   style: textTheme.bodyMedium,
                // ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
