// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';

class RunningWorkshop extends StatelessWidget {
  const RunningWorkshop({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: Offset(0, 4),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.chatsScreen);
                },
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Icon(Icons.message),
                    SizedBox(width: 40),
                    Text(AppStrings.joingroupchat, style: textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                AppStrings.progressing,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(color: AppColors.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
