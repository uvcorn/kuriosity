// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class RegistrationPowerUserController extends GetxController {
  final RxList<String> selectedExpertise = <String>[].obs;
  final TextEditingController othersExpertiseController =
      TextEditingController();
  final TextEditingController introduceYourselfController =
      TextEditingController();
  final RxList<TextEditingController> websiteControllers =
      <TextEditingController>[TextEditingController()].obs;
  final RxList<TextEditingController> socialMediaControllers =
      <TextEditingController>[TextEditingController()].obs;
  final TextEditingController workshopController = TextEditingController();

  final List<String> expertiseOptions = [
    "Shopping & Brands",
    "Food & Diet",
    "Home Farming",
    "Fashion & Clothing",
    "Driving & Commuting",
    "Energy Usage",
  ];

  void toggleExpertise(String expertise) {
    if (selectedExpertise.contains(expertise)) {
      selectedExpertise.remove(expertise);
    } else {
      selectedExpertise.add(expertise);
    }
  }

  void addWebsiteField() {
    websiteControllers.add(TextEditingController());
  }

  void removeWebsiteField(int index) {
    if (websiteControllers.length > 1) {
      websiteControllers[index].dispose();
      websiteControllers.removeAt(index);
    }
  }

  void addSocialMediaField() {
    socialMediaControllers.add(TextEditingController());
  }

  void removeSocialMediaField(int index) {
    if (socialMediaControllers.length > 1) {
      socialMediaControllers[index].dispose();
      socialMediaControllers.removeAt(index);
    }
  }

  void submitForm() {
    SnackbarHelper.show(
      message: AppStrings.formSubmittedSnackbar,
      isSuccess: true,
    );
    Get.toNamed(AppRoutes.successfullSubmitPowerUserScreen);
  }

  @override
  void onClose() {
    othersExpertiseController.dispose();
    introduceYourselfController.dispose();
    workshopController.dispose();
    for (var controller in websiteControllers) {
      controller.dispose();
    }
    for (var controller in socialMediaControllers) {
      controller.dispose();
    }
    super.onClose();
  }
}
