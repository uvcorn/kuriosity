import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/top_app_bar/top_app_bar.dart';

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
              TopAppBar(),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      AppStrings.becomeprem,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  CustomImage(imageSrc: AppIcons.premium),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              Text(
                AppStrings.investInYourself,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                AppStrings.asAPremiumUserUnlock,
                style: textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                AppStrings.thisIsForThoseReady,
                style: textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
              SizedBox(height: screenHeight * 0.01),

              Row(
                children: [
                  Text('🛠️ ', style: textTheme.bodyMedium),
                  Text(
                    AppStrings.whatYoullGet,
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
                AppStrings.exclusiveWorkshopsChallenges,
              ),
              _buildBulletPoint(
                textTheme,
                screenWidth,
                AppStrings.personalizedHabitTracker,
              ),
              _buildBulletPoint(
                textTheme,
                screenWidth,
                AppStrings.curatedToolkitResources,
              ),
              _buildBulletPoint(
                textTheme,
                screenWidth,
                AppStrings.priorityAccessPerks,
              ),
              SizedBox(height: screenHeight * 0.01),

              Row(
                children: [
                  Text('✅ ', style: textTheme.bodyMedium),
                  Text(
                    AppStrings.whyGoPremium,
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
                AppStrings.youWantToAlignValues,
              ),
              _buildBulletPoint(
                textTheme,
                screenWidth,
                AppStrings.youAreCravingSupportiveCommunity,
              ),
              _buildBulletPoint(
                textTheme,
                screenWidth,
                AppStrings.youAreReadyToMoveFromThinking,
              ),
              SizedBox(height: screenHeight * 0.01),

              Row(
                children: [
                  Text('🌱 ', style: textTheme.bodyMedium),
                  Text(
                    AppStrings.yourJourneyStartsHere,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                AppStrings.joinAsAPremiumUser,
                style: textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Links
              // GestureDetector(
              //   onTap: () {
              //     Get.toNamed(
              //       AppRoutes.priceAndPaymentMethodScreen,
              //     ); // Example navigation
              //   },
              //   child: Text(
              //     AppStrings.upgradeToPremium,
              //     style: textTheme.bodyMedium?.copyWith(
              //       color:
              //           AppColors.primary, // Assuming primary color for links
              //       decoration: TextDecoration.underline,
              //       fontSize: screenWidth * 0.04,
              //     ),
              //   ),
              // ),
              // SizedBox(height: screenHeight * 0.01),
              // GestureDetector(
              //   onTap: () {
              //     Get.snackbar(
              //       'Coming Soon',
              //       'User Stories page is not yet implemented.',
              //     );
              //   },
              //   child: Text(
              //     AppStrings.seeOurUserStories,
              //     style: textTheme.bodyMedium?.copyWith(
              //       color: AppColors.primary,
              //       decoration: TextDecoration.underline,
              //       fontSize: screenWidth * 0.04,
              //     ),
              //   ),
              // ),
              // SizedBox(height: screenHeight * 0.03),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.055,
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
              SizedBox(height: screenHeight * 0.02),
            ],
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
