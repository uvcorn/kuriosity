// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_strings/app_strings.dart';

class SignUpController extends GetxController {
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController confirmPassTEController = TextEditingController();

  final RxBool isPasswordObscure = true.obs;
  final RxBool agreedToTerms = false.obs;

  void togglePasswordVisibility() {
    isPasswordObscure.toggle();
  }

  void toggleAgreedToTerms(bool? newValue) {
    if (newValue != null) {
      agreedToTerms.value = newValue;
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailcantempty;
    }
    if (!GetUtils.isEmail(value)) {
      return AppStrings.entervalidmail;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (value.length < 6) {
      return AppStrings.passwordRequirement;
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.confirmpasswordrequird;
    }
    if (value != passwordTEController.text) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }

  void signUp() {
    // if (formKey.currentState?.validate() ?? false) {
    //   if (!agreedToTerms.value) {
    //     Get.snackbar(
    //       AppStrings.agreementreq,
    //       AppStrings.agreesignupterms,
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red.withOpacity(0.8),
    //       colorText: Colors.white,
    //     );
    //     return;
    //   }
    //   // 1. Get data from all TextEditingControllers.
    //   // 2. Make an API call to register the user.
    //   // 3. Handle success/failure.

    // }
    Get.offAllNamed(AppRoutes.signInScreen);
  }

  @override
  void onClose() {
    firstNameTEController.dispose();
    lastNameTEController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    confirmPassTEController.dispose();
    super.onClose();
  }
}
