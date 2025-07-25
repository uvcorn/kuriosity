import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import 'controller/open_new_workshop_controller.dart';
import 'widgets/dialog_helper.dart';
import 'widgets/empty_file_state.dart';
import 'widgets/group_capacity_design.dart';
import 'widgets/multi_line_text_field.dart';

class OpenNewWorkshopScreen extends StatelessWidget {
  const OpenNewWorkshopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OpenWorkshopController controller = Get.put(OpenWorkshopController());

    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize(double size) => size * screenWidth / 375;

    return Scaffold(
      backgroundColor: AppColors.lightGray,
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
                  fontSize: fontSize(16),
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
                  fontSize: fontSize(16),
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
              EmptyFileState(
                icon: Icons.description_outlined,
                message: AppStrings.noMaterial,
              ),

              SizedBox(height: screenHeight * 0.01),
              Text(
                AppStrings.coursematerial,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              EmptyFileState(
                icon: Icons.description_outlined,
                message: AppStrings.noMaterial,
              ),

              SizedBox(height: screenHeight * 0.01),
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
                controller: controller.introduceYourselfController,
                hint: AppStrings.introduceyourselfOptHint,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                textTheme: textTheme,
                textInputAction: TextInputAction.done,
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
