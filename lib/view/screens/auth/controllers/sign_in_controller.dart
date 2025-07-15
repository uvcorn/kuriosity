import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';

class SignInController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  final RxBool isPasswordObscure = true.obs;
  final RxBool rememberTerms = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordObscure.toggle();
  }

  // checkbox
  void toggleRememberMe(bool? newValue) {
    if (newValue != null) {
      rememberTerms.value = newValue;
    }
  }

  void signIn() {
    // if (formKey.currentState?.validate() ?? false) {
    //   // Perform sign-in logic
    //   Get.offAllNamed(AppRoutes.homeScreen);
    // }
    Get.offAllNamed(AppRoutes.bottomNavBar);
  }

  void goToForgotPassword() {
    Get.offAllNamed(AppRoutes.forgotPasswordScreen);
  }

  void continueWithApple() {}

  void continueWithFacebook() {}

  void continueWithGoogle() {}

  void goToSignUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }
}
