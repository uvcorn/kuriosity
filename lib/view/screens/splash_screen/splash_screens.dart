import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/custom_image/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveTONextScreen();
  }

  Future<void> _moveTONextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.firstOnbordingScreen);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(imageSrc: AppImages.logo),
            Text(AppStrings.appTitle, style: textTheme),
          ],
        ),
      ),
    );
  }
}
