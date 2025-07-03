import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/Auth/ui/screens/first_onbording_screen.dart';
import 'package:kuriosity/app/app_theme.dart';

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
    final iconColor = AppTheme.primaryColor;
    final textStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, color: iconColor, size: 60),
            Text('Wild Curisity', style: textStyle),
          ],
        ),
      ),
    );
  }
}
