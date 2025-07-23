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
                  SizedBox(height: size.height * 0.03),
                  Text(AppStrings.step1Title, style: textTheme.bodyMedium),
                  SizedBox(height: size.height * 0.02),
                  Text(AppStrings.step1Description, style: textTheme.bodySmall),
                  SizedBox(height: size.height * 0.03),
                  Divider(
                    color: AppColors.lightGray,
                    indent: size.width * 0.012,
                    endIndent: size.width * 0.012,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(AppStrings.step2Title, style: textTheme.bodyMedium),
                  SizedBox(height: size.height * 0.02),
                  Text(AppStrings.step2Description, style: textTheme.bodySmall),
                  SizedBox(height: size.height * 0.03),
                  Divider(
                    color: AppColors.lightGray,
                    indent: size.width * 0.012,
                    endIndent: size.width * 0.012,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(AppStrings.step3Title, style: textTheme.bodyMedium),
                  SizedBox(height: size.height * 0.02),
                  Text(AppStrings.step3Description, style: textTheme.bodySmall),

                  const Spacer(),
                  ActionButton(
                    title: AppStrings.nextButton,
                    onPressed: () =>
                        Get.offAllNamed(AppRoutes.thirdOnbordingScreen),
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
}
