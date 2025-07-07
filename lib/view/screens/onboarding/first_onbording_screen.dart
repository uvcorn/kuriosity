import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/action_button/action_button.dart';
import '../../components/custom_appbar/coustom_appbar.dart';

class FirstOnbordingScreen extends StatefulWidget {
  const FirstOnbordingScreen({super.key});

  @override
  State<FirstOnbordingScreen> createState() => _FirstOnbordingScreenState();
}

class _FirstOnbordingScreenState extends State<FirstOnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: CustomAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 82),
              Text(
                AppStrings.ecoInfluencerMessage,
                style: textTheme.titleLarge,
              ),
              SizedBox(height: 270),
              Text(
                AppStrings.selfActualizationMessage,
                style: textTheme.bodyMedium,
              ),
              SizedBox(height: 82),
              ActionButton(
                title: AppStrings.startButton,
                onPressed: () =>
                    Get.offAllNamed(AppRoutes.secendOnbordingScreen),
              ),
              SizedBox(height: 57),
            ],
          ),
        ),
      ),
    );
  }
}
