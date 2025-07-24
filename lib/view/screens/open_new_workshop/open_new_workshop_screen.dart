import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import 'widgets/multi_line_text_field.dart';
import 'widgets/title_discription_pair.dart';
import 'widgets/url_field.dart';

class OpenNewWorkshopScreen extends StatefulWidget {
  const OpenNewWorkshopScreen({super.key});

  @override
  State<OpenNewWorkshopScreen> createState() => _OpenNewWorkshopScreenState();
}

class _OpenNewWorkshopScreenState extends State<OpenNewWorkshopScreen> {
  final List<TitleDescriptionPair> titleDescriptionPairs = [
    TitleDescriptionPair(),
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController oneLineController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController audienceController = TextEditingController();
  final TextEditingController groupCapacityController = TextEditingController();
  final TextEditingController courseMaterialController =
      TextEditingController();
  final TextEditingController introController = TextEditingController();
  // //
  final TextEditingController othersExpertiseController =
      TextEditingController();
  final TextEditingController introduceYourselfController =
      TextEditingController();
  final TextEditingController workshopController = TextEditingController();

  final List<TextEditingController> websiteControllers = [
    TextEditingController(),
  ];
  final List<TextEditingController> socialMediaControllers = [
    TextEditingController(),
  ];

  final Set<String> selectedExpertise = {};

  void toggleExpertise(String value) {
    setState(() {
      if (selectedExpertise.contains(value)) {
        selectedExpertise.remove(value);
      } else {
        selectedExpertise.add(value);
      }
    });
  }

  void addWebsiteField() {
    setState(() {
      websiteControllers.add(TextEditingController());
    });
  }

  void removeWebsiteField(int index) {
    setState(() {
      websiteControllers.removeAt(index);
    });
  }

  void addSocialMediaField() {
    setState(() {
      socialMediaControllers.add(TextEditingController());
    });
  }

  void removeSocialMediaField(int index) {
    setState(() {
      socialMediaControllers.removeAt(index);
    });
  }

  void submitForm() {
    // Handle form submission
    // You can collect all values here
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize(double size) => size * screenWidth / 375;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Flexible(
                    child: Text(
                      AppStrings.openaNewWorkshop,
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: fontSize(20),
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),

              Text(
                AppStrings.title,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              ...List.generate(
                websiteControllers.length,
                (index) => UrlField(
                  controller: websiteControllers[index],
                  hint: AppStrings.workshoptitlehint,
                  onAdd: addWebsiteField,
                  onRemove: () => removeWebsiteField(index),
                  isLast: index == websiteControllers.length - 1,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  textTheme: textTheme,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Text(
                AppStrings.image,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    color: AppColors.backgroundLightGray,
                    child: Icon(Icons.add_a_photo_outlined),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 80,
                    width: 80,
                    color: AppColors.backgroundLightGray,
                    child: Icon(Icons.add_a_photo_outlined),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 80,
                    width: 80,
                    color: AppColors.backgroundLightGray,
                    child: Icon(Icons.add_a_photo_outlined),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 80,
                    width: 80,
                    color: AppColors.backgroundLightGray,
                    child: Icon(Icons.add_a_photo_outlined),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                AppStrings.oneLineOfExpla,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              MultiLineTextField(
                controller: workshopController,
                hint: AppStrings.oneLineOfExplaHint,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
              ),

              SizedBox(height: screenHeight * 0.03),
              Text(
                AppStrings.description,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              MultiLineTextField(
                controller: workshopController,
                hint: AppStrings.descriptionHint,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
              ),

              SizedBox(height: screenHeight * 0.03),
              Text(
                AppStrings.targatedPeople,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              MultiLineTextField(
                controller: workshopController,
                hint: AppStrings.targatedPeopleHint,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
              ),

              // Social Media
              SizedBox(height: screenHeight * 0.02),
              Text(AppStrings.groupCapacity),
              MultiLineTextField(
                controller: workshopController,
                hint: AppStrings.participants,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
                isMultiline: false,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                AppStrings.course,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              ...List.generate(
                titleDescriptionPairs.length,
                (index) => TitleDescriptionFieldPair(
                  pair: titleDescriptionPairs[index],
                  onAdd: () {
                    setState(() {
                      titleDescriptionPairs.add(TitleDescriptionPair());
                    });
                  },
                  onRemove: index != titleDescriptionPairs.length - 1
                      ? () {
                          setState(() {
                            titleDescriptionPairs.removeAt(index);
                          });
                        }
                      : null,
                  isLast: index == titleDescriptionPairs.length - 1,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  textTheme: textTheme,
                  fontSize: fontSize,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),
              Text(
                AppStrings.coursematerial,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              ...List.generate(
                socialMediaControllers.length,
                (index) => UrlField(
                  controller: socialMediaControllers[index],
                  hint: AppStrings.coursematerialHint,
                  onAdd: addSocialMediaField,
                  onRemove: () => removeSocialMediaField(index),
                  isLast: index == socialMediaControllers.length - 1,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  textTheme: textTheme,
                ),
              ),

              SizedBox(height: screenHeight * 0.03),
              Text(
                AppStrings.introduceyourselfOpt,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: fontSize(16),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              MultiLineTextField(
                controller: workshopController,
                hint: AppStrings.introduceyourselfOptHint,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
              ),

              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.055,
                child: ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    AppStrings.upload,
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

class TitleDescriptionPair {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  TitleDescriptionPair({
    TextEditingController? titleController,
    TextEditingController? descriptionController,
  }) : titleController = titleController ?? TextEditingController(),
       descriptionController = descriptionController ?? TextEditingController();
}
