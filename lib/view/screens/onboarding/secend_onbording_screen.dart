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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 94),
            Text(AppStrings.ecoInfluencerIntro, style: textTheme.titleLarge),
            SizedBox(height: 24),
            Text(AppStrings.step1Title, style: textTheme.bodyMedium),
            SizedBox(height: 16),
            Text(AppStrings.step1Description, style: textTheme.bodySmall),
            SizedBox(height: 24),
            Divider(
              height: 0,
              thickness: 1,
              color: Colors.grey[300],
              indent: 5,
              endIndent: 5,
            ),
            SizedBox(height: 24),
            Text(AppStrings.step2Title, style: textTheme.bodyMedium),
            SizedBox(height: 16),
            Text(AppStrings.step2Description, style: textTheme.bodySmall),
            SizedBox(height: 24),
            Divider(
              height: 0,
              thickness: 1,
              color: Colors.grey[300],
              indent: 5,
              endIndent: 5,
            ),
            SizedBox(height: 24),
            Text(AppStrings.step3Title, style: textTheme.bodyMedium),
            SizedBox(height: 16),
            Text(AppStrings.step3Description, style: textTheme.bodySmall),
            SizedBox(height: 80),
            ActionButton(
              title: AppStrings.nextButton,
              onPressed: () => Get.offAllNamed(AppRoutes.thirdOnbordingScreen),
            ),

            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
