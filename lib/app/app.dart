import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/app/app_theme.dart';
import 'package:kuriosity/features/splash/ui/screens/splash_screens.dart';

class WildCurosity extends StatefulWidget {
  const WildCurosity({super.key});

  @override
  State<WildCurosity> createState() => _WildCurosityState();
}

class _WildCurosityState extends State<WildCurosity> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData,
      home: SplashScreens(),
    );
  }
}
