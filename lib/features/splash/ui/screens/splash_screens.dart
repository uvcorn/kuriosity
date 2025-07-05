import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kuriosity/features/onboarding/ui/screens/first_onbording_screen.dart';
import 'package:kuriosity/utils/app_images/app_images.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    super.initState();
    _moveTONextScreen();
  }

  Future<void> _moveTONextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Get.off(FirstOnbordingScreen());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logo),
            Text('Wild Curisity', style: textTheme),
          ],
        ),
      ),
    );
  }
}
