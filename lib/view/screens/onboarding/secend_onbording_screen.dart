import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../components/action_button/action_button.dart';

class SecendOnbordingScreen extends StatefulWidget {
  const SecendOnbordingScreen({super.key});

  @override
  State<SecendOnbordingScreen> createState() => _SecendOnbordingScreenState();
}

class _SecendOnbordingScreenState extends State<SecendOnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: size.height - MediaQuery.of(context).padding.top,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.05),
                  Text(
                    AppStrings.ecoInfluencerIntro,
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(height: size.height * 0.06),
                  stepTitleDescription(
                    textTheme,
                    size,
                    AppStrings.step1Title,
                    AppStrings.step1Description,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Divider(
                    color: AppColors.lightGray,
                    indent: size.width * 0.012,
                    endIndent: size.width * 0.012,
                  ),
                  SizedBox(height: size.height * 0.03),
                  stepTitleDescription(
                    textTheme,
                    size,
                    AppStrings.step2Title,
                    AppStrings.step2Description,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Divider(
                    color: AppColors.lightGray,
                    indent: size.width * 0.012,
                    endIndent: size.width * 0.012,
                  ),
                  SizedBox(height: size.height * 0.03),
                  stepTitleDescription(
                    textTheme,
                    size,
                    AppStrings.step3Title,
                    AppStrings.step3Description,
                  ),

                  const Spacer(),
                  ActionButton(
                    title: AppStrings.nextButton,
                    onPressed: () =>
                        Get.toNamed(AppRoutes.thirdOnbordingScreen),
                  ),
                  SizedBox(height: size.height * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget stepTitleDescription(
    TextTheme textTheme,
    Size size,
    String title,
    String description,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.bodyMedium),
        SizedBox(height: size.height * 0.02),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(description, style: textTheme.bodySmall),
        ),
      ],
    );
  }
}
