import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';
import '../course_model/open_workshop_model.dart';

class DialogHelper {
  static Future<void> showAddCourseDialog({
    OpenWorkshopModel? initialCourse,
    required void Function(OpenWorkshopModel course) onSubmit,
  }) async {
    final textTheme = Theme.of(Get.context!).textTheme;
    final titleController = TextEditingController(text: initialCourse?.title);
    final descriptionController = TextEditingController(
      text: initialCourse?.description,
    );

    DateTime? selectedDate = initialCourse?.date;
    TimeOfDay? selectedTime = initialCourse?.time;

    await showDialog(
      context: Get.context!, // Use Get.context!
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundWhite,
          title: Text(
            initialCourse == null
                ? AppStrings.addNewCourse
                : AppStrings.editCourse,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.courseTitle, style: textTheme.bodyMedium),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: AppStrings.workshoptitlehint,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppStrings.courseDescription,
                      style: textTheme.bodyMedium,
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: AppStrings.courseTitlehint,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: null,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.date,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(height: 6),
                              InkWell(
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate ?? DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: AppColors.primary,
                                            onPrimary: Colors.white,
                                            onSurface: AppColors.black,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor:
                                                  AppColors.primary,
                                            ),
                                          ),
                                          // **Crucial for DatePicker header text size:**
                                          textTheme: TextTheme(
                                            headlineLarge: textTheme
                                                .bodyLarge, // Adjust this as needed
                                            headlineMedium: textTheme.bodyLarge,
                                            headlineSmall: textTheme
                                                .bodyLarge, //  selected date header
                                            titleLarge: textTheme
                                                .bodyMedium, // month/year header
                                            bodyLarge: textTheme
                                                .bodyMedium, // Day numbers
                                            bodyMedium: textTheme
                                                .bodySmall, // Weekday labels
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  if (picked != null) {
                                    setState(() => selectedDate = picked);
                                  }
                                },
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.backgroundWhite,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 14,
                                    ),
                                  ),
                                  child: Text(
                                    selectedDate != null
                                        ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                        : AppStrings.dayMonthYearFormate,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.time,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(height: 6),
                              InkWell(
                                onTap: () async {
                                  final picked = await showTimePicker(
                                    context: context,
                                    initialTime:
                                        selectedTime ?? TimeOfDay.now(),
                                    builder: (context, child) {
                                      // Override the theme for the time picker dialog
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          timePickerTheme: TimePickerThemeData(
                                            backgroundColor:
                                                AppColors.backgroundWhite,
                                            dialBackgroundColor:
                                                AppColors.backgroundWhite,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            // **Crucial for TimePicker text sizes:**
                                            hourMinuteTextStyle: textTheme
                                                .displayLarge
                                                ?.copyWith(
                                                  fontSize: 48,
                                                ), // Large hour/minute display
                                            dayPeriodTextStyle: textTheme
                                                .titleLarge, // AM/PM text
                                            // entryModeButtonTextStyle: textTheme.bodyLarge, // OK/Cancel text
                                            // headerTextStyle: textTheme.headlineSmall, // Top header text (e.g., "Select time")
                                          ),
                                          colorScheme: ColorScheme.light(
                                            primary: AppColors.primary,
                                            onPrimary: Colors.white,
                                            onSurface: AppColors.black,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor: AppColors.black,
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  if (picked != null) {
                                    setState(() => selectedTime = picked);
                                  }
                                },
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.backgroundWhite,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 14,
                                    ),
                                  ),
                                  child: Text(
                                    selectedTime != null
                                        ? selectedTime!.format(context)
                                        : '--:--',
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(), // Use Get.back()
              child: Text(
                AppStrings.cancel,
                style: const TextStyle(color: AppColors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.trim().isEmpty ||
                    selectedDate == null ||
                    selectedTime == null) {
                  SnackbarHelper.show(
                    message: AppStrings.pleaseFIllsAllFields,
                    isSuccess: true,
                  );
                  return;
                }

                onSubmit(
                  OpenWorkshopModel(
                    title: titleController.text.trim(),
                    description: descriptionController.text.trim(),
                    date: selectedDate!,
                    time: selectedTime!,
                  ),
                );

                Get.back(); // Use Get.back()
              },
              child: Text(
                initialCourse == null
                    ? AppStrings.addNewCourse
                    : AppStrings.editCourse,
              ),
            ),
          ],
        );
      },
    );
  }
}
