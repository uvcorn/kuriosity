// lib/app/modules/phone_input/controllers/phone_input_controller.dart
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneInputController extends GetxController {
  final Rx<Country?> selectedCountry = Rx<Country?>(null);
  final TextEditingController mobileTEController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Set United Kingdom (London's country) as the default country
    selectedCountry.value = Country(
      phoneCode: '44', // Phone code for United Kingdom
      countryCode: 'GB', // Country code for United Kingdom
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'United Kingdom', // Name of the country
      example: '7911123456', // An example phone number format
      displayName: 'United Kingdom (GB) [+44]',
      displayNameNoCountryCode: 'United Kingdom (GB)',
      e164Key: '',
    );
  }

  @override
  void onClose() {
    mobileTEController.dispose();
    super.onClose();
  }

  void onCountryChanged(Country country) {
    selectedCountry.value = country;
  }

  void continueToSignUp() {
    String? countryCode = selectedCountry.value?.phoneCode;
    String phoneNumber = mobileTEController.text;

    if (countryCode != null && phoneNumber.isNotEmpty) {
      Get.snackbar(
        'Phone Number',
        'Selected: +$countryCode $phoneNumber',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please select a country and enter your phone number.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void continueWithApple() {
    Get.snackbar('Apple Login', 'Continue with Apple tapped!');
  }

  void continueWithFacebook() {
    Get.snackbar('Facebook Login', 'Continue with Facebook tapped!');
  }

  void continueWithGoogle() {
    Get.snackbar('Google Login', 'Continue with Google tapped!');
  }
}
