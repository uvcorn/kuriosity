import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';

class AuthController extends GetxController {
  final RxBool _isPremiumUser = false.obs;
  final RxBool _isRegister = false.obs;

  bool get isPremiumUser => _isPremiumUser.value;
  RxBool get isRegister => _isRegister;

  void register() {
    _isRegister.value = true;
  }

  void cancelRegister() {
    _isRegister.value = false;
  }

  void upgradeToPremium() {
    _isPremiumUser.value = true;

    Get.rawSnackbar(
      animationDuration: Duration(seconds: 1),
      messageText: Center(
        child: Column(
          children: [
            Text(
              'Success',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'You are now a premium user!',

              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.lightBlueBackground,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      borderRadius: 10,
    );
  }
}
