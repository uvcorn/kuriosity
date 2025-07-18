// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';
import '../../controller/auth_controller.dart';

class NonPremiumBottomBar extends StatelessWidget {
  const NonPremiumBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 80,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightGray.withOpacity(0.3),
          border: Border.all(color: AppColors.lightGray, width: 1),
        ),
        child: Column(
          children: [
            SizedBox(height: 8),
            Text(
              AppStrings.basicres,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                authController.upgradeToPremium();
              },
              child: Text(
                AppStrings.becomeprem,
                style: textTheme.bodySmall?.copyWith(color: AppColors.primary),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 160,
              child: Divider(color: AppColors.primary, thickness: 1, height: 0),
            ),
          ],
        ),
      ),
    );
  }
}
