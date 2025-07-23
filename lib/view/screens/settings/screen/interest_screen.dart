import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../controllers/interest_controller.dart';

class InterestScreen extends StatelessWidget {
  final List<String> initialSelectedInterests;

  const InterestScreen({super.key, this.initialSelectedInterests = const []});

  @override
  Widget build(BuildContext context) {
    final InterestController controller = Get.put(
      InterestController(initialSelectedInterests),
    );
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final chipHeight = size.height * 0.05;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(AppStrings.interest, style: textTheme.bodyLarge),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: controller.selectedInterests.toList());
            },
            child: const Text(
              AppStrings.save,
              style: TextStyle(color: AppColors.primary, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => controller.selectedInterests.isNotEmpty
                  ? Wrap(
                      spacing: size.width * 0.02,
                      runSpacing: size.height * 0.01,
                      children: controller.selectedInterests.map((interest) {
                        return Chip(
                          label: Text(interest),
                          backgroundColor: AppColors.lightBlueBackground,
                          labelStyle: const TextStyle(color: AppColors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          labelPadding: EdgeInsets.zero,
                        );
                      }).toList(),
                    )
                  : const SizedBox(),
            ),
            SizedBox(height: size.height * 0.02),
            Obx(
              () => Text(
                'Select up to (${controller.selectedInterests.length}/${controller.maxSelection})',
                style: const TextStyle(color: AppColors.mediumGray),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: size.width * 0.025,
                  runSpacing: size.height * 0.015,
                  alignment: WrapAlignment.start,
                  children: controller.allInterests.map((interest) {
                    return SizedBox(
                      height: chipHeight,
                      child: Obx(() {
                        final isSelected = controller.selectedInterests
                            .contains(interest);
                        return ActionChip(
                          label: Text(interest),
                          onPressed: () => controller.toggleInterest(interest),
                          backgroundColor: isSelected
                              ? AppColors.lightBlueBackground
                              : AppColors.white,
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
                              width: 1.5,
                            ),
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        );
                      }),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
