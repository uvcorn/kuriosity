import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_strings/app_strings.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.06),
        child: CustomAppbar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.1),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.ecoInfluencerMessage,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: size.width * 0.09,
                    ),
                  ),
                  Text(
                    AppStrings.selfActualizationMessage,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.0875),
            ActionButton(
              title: AppStrings.startButton,
              onPressed: () => Get.toNamed(AppRoutes.secendOnbordingScreen),
            ),
            SizedBox(height: size.height * 0.04),
          ],
        ),
      ),
    );
  }
}
