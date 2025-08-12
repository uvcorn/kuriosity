import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/top_app_bar/top_app_bar.dart';

class PowerUserDetailsScreen extends StatelessWidget {
  const PowerUserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.064,
              vertical: screenHeight * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopAppBar(),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        AppStrings.becomepower,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.021),
                    const CustomImage(imageSrc: AppIcons.power),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  AppStrings.leadInspireShapeCulture,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  AppStrings.asAPowerUser,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: screenWidth * 0.04,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  AppStrings.powerUsersAreTrustedCommunity,
                  style: textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
                SizedBox(height: screenHeight * 0.03),

                Row(
                  children: [
                    Text('🛠️ ', style: textTheme.bodyMedium),
                    SizedBox(width: 8),
                    Text(
                      AppStrings.whatYoullGetPowerUser,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                _buildBulletPoint(
                  textTheme,
                  screenWidth,
                  AppStrings.hostYourOwnWorkshops,
                ),
                _buildBulletPoint(
                  textTheme,
                  screenWidth,
                  AppStrings.buildAFollowing,
                ),
                _buildBulletPoint(
                  textTheme,
                  screenWidth,
                  AppStrings.growYourInfluence,
                ),
                _buildBulletPoint(
                  textTheme,
                  screenWidth,
                  AppStrings.earnAndElevate,
                ),
                SizedBox(height: screenHeight * 0.01),

                Row(
                  children: [
                    Text('✅ ', style: textTheme.bodySmall),
                    SizedBox(width: 8),
                    Text(
                      AppStrings.whatWeLookFor,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                _buildBulletPoint(
                  textTheme,
                  screenWidth,
                  AppStrings.aGenuinePassion,
                ),
                _buildBulletPoint(
                  textTheme,
                  screenWidth,
                  AppStrings.strongStorytellingSkills,
                ),
                _buildBulletPoint(
                  textTheme,
                  screenWidth,
                  AppStrings.aCommitmentToCreatingSpaces,
                ),
                _buildBulletPoint(
                  textTheme,
                  screenWidth,
                  AppStrings.willingnessToShowUpConsistently,
                ),
                SizedBox(height: screenHeight * 0.01),

                Row(
                  children: [
                    Text('💬 ', style: textTheme.bodySmall),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        AppStrings.readyToInspireNextWave,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  AppStrings.applyToBecomePowerUser,
                  style: textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.058,
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

  // Helper widget for consistent bullet point styling
  Widget _buildBulletPoint(
    TextTheme textTheme,
    double screenWidth,
    String text,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10,
      ), // Adjust spacing between bullet points
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.02, // Indent for bullet point
            child: Text(
              '•',
              style: textTheme.bodyMedium?.copyWith(
                fontSize: screenWidth * 0.04,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: screenWidth * 0.04,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
