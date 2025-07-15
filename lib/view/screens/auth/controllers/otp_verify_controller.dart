import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';

class OtpVerifyController extends GetxController {
  final TextEditingController otpTEController = TextEditingController();

  void verifyOtp() {
    // 1. Get the OTP from otpTEController.text.
    // 2. Make an API call to verify the OTP.
    // 3. Handle success/failure
    Get.offAllNamed(AppRoutes.resetPasswordScreen);
  }

  void resendCode() {}

  // @override
  // void onClose() {
  //   otpTEController.dispose();
  //   super.onClose();
  // }
}
