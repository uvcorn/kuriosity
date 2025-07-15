import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController confirmPassTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool isPasswordObscure = true.obs;

  void togglePasswordVisibility() {
    isPasswordObscure.toggle();
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (value.length < 6) {
      return AppStrings.passwordLength;
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (value != passwordTEController.text) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }

  void resetPassword() {
    // if (formKey.currentState?.validate() ?? false) {
    //   // 1. Get new password from passwordTEController.text
    //   // 2. Make an API call to reset the password.
    //   // 3. Handle success/failure

    // }

    Get.offAllNamed(AppRoutes.signInScreen);
  }

  @override
  void onClose() {
    passwordTEController.dispose();
    confirmPassTEController.dispose();
    super.onClose();
  }
}
