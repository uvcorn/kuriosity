import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
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
    final double chipHeight = 38.0;

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => controller.selectedInterests.isNotEmpty
                  ? Wrap(
                      spacing: 8,
                      runSpacing: 8,
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
            const SizedBox(height: 16),
            Obx(
              () => Text(
                'Select up to (${controller.selectedInterests.length}/${controller.maxSelection})',
                style: const TextStyle(color: AppColors.mediumGray),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
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
