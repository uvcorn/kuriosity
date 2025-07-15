import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';

class PhoneInputController extends GetxController {
  final Rx<CountryCode?> selectedCountryCode = Rx<CountryCode?>(null);
  final TextEditingController mobileTEController = TextEditingController();

  void onCountryCodeChanged(CountryCode countryCode) {
    selectedCountryCode.value = countryCode;
  }

  void continueToSignUp() {
    Get.offAllNamed(AppRoutes.signUpScreen);
  }

  // Social login
  void continueWithApple() {}

  void continueWithFacebook() {}

  void continueWithGoogle() {}

  @override
  void onClose() {
    mobileTEController.dispose();
    super.onClose();
  }
}
