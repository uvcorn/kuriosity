import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../controllers/registration_Power_use_controller.dart';

class RegistrationPowerUserScreen
    extends GetView<RegistrationPowerUserController> {
  const RegistrationPowerUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<RegistrationPowerUserController>()) {
      Get.put(RegistrationPowerUserController());
    }

    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Helper for font sizes
    double fontSize(double size) => size * screenWidth / 375; // Base width: 375

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06, // ~24px on 400 width
            vertical: screenHeight * 0.02, // ~16px on 800 height
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      AppStrings.becomepower,
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: fontSize(20),
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  const CustomImage(imageSrc: AppIcons.power),
                ],
              ),
              SizedBox(height: screenHeight * 0.025),
              Text(
                AppStrings.registrationForm,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.012),

              Text(
                AppStrings.expertiseArea,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize(14),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Obx(
                () => Wrap(
                  spacing: screenWidth * 0.02,
                  runSpacing: screenHeight * 0.015,
                  children: controller.expertiseOptions.map((expertise) {
                    return ChoiceChip(
                      label: Text(
                        expertise,
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: fontSize(13),
                          color:
                              controller.selectedExpertise.contains(expertise)
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                      selected: controller.selectedExpertise.contains(
                        expertise,
                      ),
                      selectedColor: AppColors.primary,
                      backgroundColor: AppColors.white,
                      onSelected: (bool selected) {
                        controller.toggleExpertise(expertise);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        side: BorderSide(
                          color:
                              controller.selectedExpertise.contains(expertise)
                              ? AppColors.primary
                              : AppColors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Others text field
              Row(
                children: [
                  Text(
                    AppStrings.others,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: fontSize(13),
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        border: Border.all(color: AppColors.black),
                      ),
                      child: TextField(
                        controller: controller.othersExpertiseController,
                        decoration: InputDecoration(
                          hintText: AppStrings.pleaseSpecify,
                          hintStyle: textTheme.bodySmall?.copyWith(
                            fontSize: fontSize(13),
                            color: AppColors.gray,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.03,
                            vertical: screenHeight * 0.01,
                          ),
                        ),
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: fontSize(13),
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),

              Text(
                AppStrings.introduceYourself,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Container(
                height: screenHeight * 0.12,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  border: Border.all(color: AppColors.black),
                ),
                child: TextField(
                  controller: controller.introduceYourselfController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: AppStrings.writeaboutyourself,
                    hintStyle: textTheme.bodySmall?.copyWith(
                      fontSize: fontSize(13),
                      color: AppColors.gray,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(screenWidth * 0.03),
                  ),
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: fontSize(13),
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              Text(
                AppStrings.websiteShare,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Obx(
                () => Column(
                  children: List.generate(
                    controller.websiteControllers.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.012),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: screenHeight * 0.055,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.02,
                                ),
                                border: Border.all(color: AppColors.black),
                              ),
                              child: TextField(
                                controller:
                                    controller.websiteControllers[index],
                                decoration: InputDecoration(
                                  hintText: AppStrings.enterwebsiteURL,
                                  hintStyle: textTheme.bodySmall?.copyWith(
                                    fontSize: fontSize(13),
                                    color: Colors.grey[400],
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.03,
                                    vertical: screenHeight * 0.01,
                                  ),
                                ),
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: fontSize(13),
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          if (index == controller.websiteControllers.length - 1)
                            GestureDetector(
                              onTap: controller.addWebsiteField,
                              child: Icon(
                                Icons.add_circle_outline,
                                color: AppColors.black,
                                size: screenWidth * 0.07,
                              ),
                            )
                          else
                            GestureDetector(
                              onTap: () => controller.removeWebsiteField(index),
                              child: Icon(
                                Icons.remove_circle,
                                color: AppColors.black,
                                size: screenWidth * 0.07,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Text(
                AppStrings.socialMediaShare,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Obx(
                () => Column(
                  children: List.generate(
                    controller.socialMediaControllers.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.012),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: screenHeight * 0.055,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.02,
                                ),
                                border: Border.all(color: AppColors.black),
                              ),
                              child: TextField(
                                controller:
                                    controller.socialMediaControllers[index],
                                decoration: InputDecoration(
                                  hintText: AppStrings.entersocialmediaURL,
                                  hintStyle: textTheme.bodySmall?.copyWith(
                                    fontSize: fontSize(13),
                                    color: AppColors.gray,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.03,
                                    vertical: screenHeight * 0.01,
                                  ),
                                ),
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: fontSize(13),
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          if (index ==
                              controller.socialMediaControllers.length - 1)
                            GestureDetector(
                              onTap: controller.addSocialMediaField,
                              child: Icon(
                                Icons.add_circle_outline,
                                color: AppColors.black,
                                size: screenWidth * 0.07,
                              ),
                            )
                          else
                            GestureDetector(
                              onTap: () =>
                                  controller.removeSocialMediaField(index),
                              child: Icon(
                                Icons.remove_circle,
                                color: AppColors.black,
                                size: screenWidth * 0.07,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              Text(
                AppStrings.workshopProvide,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Container(
                height: screenHeight * 0.12,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  border: Border.all(color: AppColors.black),
                ),
                child: TextField(
                  controller: controller.workshopController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: AppStrings.describeyourworkshop,
                    hintStyle: textTheme.bodySmall?.copyWith(
                      fontSize: fontSize(13),
                      color: AppColors.gray,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(screenWidth * 0.03),
                  ),
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: fontSize(13),
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.055,
                child: ElevatedButton(
                  onPressed: controller.submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    AppStrings.submit,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize(16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}
