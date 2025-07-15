import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller_binder.dart';
import 'core/app_routes/app_routes.dart';
import 'utils/app_theme/app_theme.dart';
import 'view/screens/splash_screen/splash_screens.dart';

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
      initialBinding: ControllerBinder(),
      theme: AppTheme.lightThemeData,
      home: SplashScreen(),
      getPages: AppRoutes.routes,
    );
  }
}
