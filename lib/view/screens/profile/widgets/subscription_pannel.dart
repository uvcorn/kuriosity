import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../controller/attended_workshop_controller.dart';
import 'attended_workshop_card.dart';

Widget buildSubscriptionPannel(TextTheme textTheme, bool isPremium) {
  final AttendedWorkshopController attendedWorkshopController = Get.put(
    AttendedWorkshopController(),
  );
  return isPremium
      ? Column(
          children: [
            _buildCardBar(textTheme, AppStrings.attendw, AppStrings.viewall),
            const SizedBox(height: 8),
            Container(
              height: 95,
              decoration: BoxDecoration(
                color: AppColors.backgroundLightGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Obx(
                () => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      attendedWorkshopController.attendedWorkshops.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final workshop =
                        attendedWorkshopController.attendedWorkshops[index];
                    return AttendedWorkshopCard(workshop: workshop);
                  },
                ),
              ),
            ),
          ],
        )
      : Column(
          children: [
            _buildCardBar(textTheme, AppStrings.attendw, AppStrings.viewall),
            const SizedBox(height: 8),
            Container(
              height: 48,
              width: double.infinity,
              decoration: const BoxDecoration(color: AppColors.backgroundWhite),
              child: Center(
                child: Text(AppStrings.basicUser, style: textTheme.bodySmall),
              ),
            ),
          ],
        );
}

Widget _buildCardBar(TextTheme textTheme, String title, [String? subtitle]) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),
      ),
      if (subtitle != null && subtitle.isNotEmpty)
        Text(subtitle, style: textTheme.bodySmall),
    ],
  );
}
