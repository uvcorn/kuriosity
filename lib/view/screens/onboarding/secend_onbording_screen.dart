import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight - MediaQuery.of(context).padding.top,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40), // Better than hardcoded 94
                  Text(
                    AppStrings.ecoInfluencerIntro,
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(AppStrings.step1Title, style: textTheme.bodyMedium),
                  const SizedBox(height: 16),
                  Text(AppStrings.step1Description, style: textTheme.bodySmall),
                  const SizedBox(height: 24),
                  Divider(color: Colors.grey[300], indent: 5, endIndent: 5),
                  const SizedBox(height: 24),
                  Text(AppStrings.step2Title, style: textTheme.bodyMedium),
                  const SizedBox(height: 16),
                  Text(AppStrings.step2Description, style: textTheme.bodySmall),
                  const SizedBox(height: 24),
                  Divider(color: Colors.grey[300], indent: 5, endIndent: 5),
                  const SizedBox(height: 24),
                  Text(AppStrings.step3Title, style: textTheme.bodyMedium),
                  const SizedBox(height: 16),
                  Text(AppStrings.step3Description, style: textTheme.bodySmall),

                  const Spacer(),
                  ActionButton(
                    title: AppStrings.nextButton,
                    onPressed: () =>
                        Get.offAllNamed(AppRoutes.thirdOnbordingScreen),
                  ),
                  const SizedBox(height: 57),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
