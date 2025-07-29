import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/top_app_bar/top_app_bar.dart';
import '../controllers/interest_controller.dart';

class InterestScreen extends StatelessWidget {
  final List<String> initialSelectedInterests;

  const InterestScreen({super.key, this.initialSelectedInterests = const []});

  @override
  Widget build(BuildContext context) {
    // Get.put ensures the controller is initialized and available
    final InterestController controller = Get.put(
      InterestController(initialSelectedInterests),
    );
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: TopAppBar(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              Text(
                                AppStrings.interest,
                                style: textTheme.bodyLarge,
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {
                                  Get.back(
                                    result: controller.selectedInterests
                                        .toList(),
                                  );
                                },
                                child: const Text(
                                  AppStrings.save,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => controller.selectedInterests.isNotEmpty
                                ? Wrap(
                                    spacing: size.width * 0.02,
                                    runSpacing: size.height * 0.01,
                                    children: controller.selectedInterests.map((
                                      interest,
                                    ) {
                                      return Chip(
                                        label: Text(interest),
                                        backgroundColor:
                                            AppColors.lightBlueBackground,
                                        labelStyle: const TextStyle(
                                          color: AppColors.black,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          side: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          // vertical: 4,
                                        ),
                                        deleteIcon: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: AppColors.black,
                                        ),
                                        onDeleted: () =>
                                            controller.toggleInterest(interest),
                                      );
                                    }).toList(),
                                  )
                                : const SizedBox(),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Obx(
                            () => Text(
                              'Select up to ${controller.maxSelection - controller.selectedInterests.length}',
                              style: const TextStyle(
                                color: AppColors.mediumGray,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Wrap(
                            spacing: size.width * 0.02,
                            runSpacing: size.height * 0.015,
                            alignment: WrapAlignment.start,
                            children: controller.allInterests.map((interest) {
                              return Obx(() {
                                final isSelected = controller.selectedInterests
                                    .contains(interest);
                                return ActionChip(
                                  label: Text(interest),
                                  onPressed: () =>
                                      controller.toggleInterest(interest),
                                  backgroundColor: AppColors.white,
                                  labelStyle: TextStyle(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.black,
                                    fontSize: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      color: isSelected
                                          ? AppColors.primary
                                          : AppColors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                );
                              });
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
