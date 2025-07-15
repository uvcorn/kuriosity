import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();

  void getVerificationCode() {
    // 1. Validate the email
    // 2. Set isLoading.value = true;
    // 3. Make an API call to send the verification code.
    // 4. Handle success/failure (e.g., show a snackbar, navigate).
    // 5. Set isLoading.value = false;
    Get.offAllNamed(AppRoutes.otpVerifyScreen);
  }

  @override
  void onClose() {
    emailTEController.dispose();
    super.onClose();
  }
}
