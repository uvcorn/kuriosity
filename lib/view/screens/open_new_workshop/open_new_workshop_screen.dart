import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../components/snackbar_helper/snackbar_helper.dart';
import '../../components/top_app_bar/top_app_bar.dart';
import 'controller/image_picker_grid_controller.dart';
import 'controller/open_new_workshop_controller.dart';
import 'course_model/material_item.dart';
import 'widgets/dialog_helper.dart';
import 'widgets/empty_file_state.dart';
import 'widgets/group_capacity_design.dart';
import 'widgets/multi_line_text_field.dart';
import 'widgets/url_field.dart';
import 'widgets/video_picker_section.dart';

class OpenNewWorkshopScreen extends StatefulWidget {
  const OpenNewWorkshopScreen({super.key});

  @override
  State<OpenNewWorkshopScreen> createState() => _OpenNewWorkshopScreenState();
}

class _OpenNewWorkshopScreenState extends State<OpenNewWorkshopScreen> {
  final List<MaterialItem> materialItems = [
    MaterialItem(controller: TextEditingController()),
  ];

  void addMaterialWithFile(int index) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      // allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        materialItems[index].attachedFile = File(result.files.single.path!);
        materialItems.add(MaterialItem(controller: TextEditingController()));
      });
    }
  }

  void removeMaterial(int index) {
    setState(() {
      if (materialItems.length > 1) {
        materialItems.removeAt(index);
      } else {
        materialItems[0].controller.clear();
        materialItems[0].attachedFile = null;
      }
    });
  }

  void removeOnlyFile(int index) {
    setState(() {
      materialItems[index].attachedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final OpenWorkshopController controller =
        Get.find<OpenWorkshopController>();
    final ImagePickerGridController imageGridController =
        Get.find<ImagePickerGridController>();

    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize(double size) => size * screenWidth / 375;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopAppBar(),
              // Header
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
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
              SizedBox(height: screenHeight * 0.02),

              Text(
                AppStrings.title,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              MultiLineTextField(
                controller: controller.workshopTitleController,
                hint: AppStrings.workshoptitlehint,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
                isMultiline: false,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                AppStrings.image,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 8),
              Obx(() {
                final images = imageGridController.images;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    final image = images[index];

                    return GestureDetector(
                      onTap: () => imageGridController.pickImageForIndex(index),
                      child: Stack(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                              image: image != null
                                  ? DecorationImage(
                                      image: FileImage(image),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: image == null
                                ? Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Colors.grey,
                                  )
                                : null,
                          ),
                          if (image != null)
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () => imageGridController
                                    .removeImageAtIndex(index),
                                child: const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.black54,
                                  child: Icon(
                                    Icons.close,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                );
              }),

              SizedBox(height: screenHeight * 0.03),
              Text(
                AppStrings.oneLineOfExpla,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              MultiLineTextField(
                controller: controller.oneLineExplanationController,
                hint: AppStrings.oneLineOfExplaHint,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
                isMultiline: false,
              ),

              SizedBox(height: screenHeight * 0.03),
              Text(
                AppStrings.description,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              MultiLineTextField(
                controller: controller.descriptionController,
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
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              MultiLineTextField(
                controller: controller.targetedPeopleController,
                hint: AppStrings.targatedPeopleHint,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
              ),

              // Social Media
              SizedBox(height: screenHeight * 0.02),

              GroupCapacityDesign(),
              SizedBox(height: screenHeight * 0.005),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppStrings.course,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          DialogHelper.showAddCourseDialog(
                            onSubmit: controller.addCourse,
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: AppColors.white,
                            ),
                            Text(AppStrings.addcourse),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => controller.courses.isEmpty
                        ? EmptyFileState(
                            icon: Icons.description_outlined,
                            message: AppStrings.noCourseData,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.courses.length,
                            itemBuilder: (context, index) {
                              final course = controller.courses[index];
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                color: AppColors.backgroundWhite,
                                child: ListTile(
                                  title: Text(course.title),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(course.description),
                                      SizedBox(height: 4),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 16,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "${course.date.day}/${course.date.month}/${course.date.year}",
                                                ),
                                                SizedBox(width: 8),
                                                SizedBox(width: 4),
                                                Text(
                                                  course.time.format(context),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          DialogHelper.showAddCourseDialog(
                                            initialCourse: course,
                                            onSubmit: (updatedCourse) {
                                              controller.editCourse(
                                                index,
                                                updatedCourse,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.black,
                                        ),
                                        onPressed: () =>
                                            controller.deleteCourse(index),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.01),
              Text(
                AppStrings.coursematerial,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              ...List.generate(materialItems.length, (index) {
                final item = materialItems[index];
                return Column(
                  children: [
                    UrlField(
                      controller: item.controller,
                      hint: AppStrings.coursematerialHint,
                      onAdd: () => addMaterialWithFile(index),
                      onRemove: () => removeMaterial(index),
                      isLast: index == materialItems.length - 1,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                    if (item.attachedFile != null)
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.012),
                        child: Row(
                          children: [
                            Icon(Icons.insert_drive_file_outlined),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.attachedFile!.path.split('/').last,
                                style: textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, color: AppColors.black),
                              onPressed: () => removeOnlyFile(index),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              }),

              SizedBox(height: screenHeight * 0.01),
              VideoPickerSection(),

              SizedBox(height: screenHeight * 0.01),
              Text(
                AppStrings.introduceyourselfOpt,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              MultiLineTextField(
                controller: controller.introduceYourselfController,
                hint: AppStrings.introduceyourselfOptHint,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
                textInputAction: TextInputAction.done,
                isMultiline: false,
              ),

              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.055,
                child: ElevatedButton(
                  onPressed: () {
                    controller.reset();
                    imageGridController.reset();
                    Get.back();
                    SnackbarHelper.show(
                      message: AppStrings.workshopOpenSuccessfully,
                      isSuccess: true,
                    );
                  },
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
