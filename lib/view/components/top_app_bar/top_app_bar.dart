import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../bottom_nav_bar/bottom_nav_controller.dart';
import '../custom_image/custom_image.dart';

class TopAppBar extends StatelessWidget {
  final String? trailingIcon; // path to custom icon image
  final VoidCallback? onTrailingTap;

  const TopAppBar({super.key, this.trailingIcon, this.onTrailingTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              final BottomNavController navcontroller =
                  Get.find<BottomNavController>();
              navcontroller.changeIndex(0);
              Get.offAll(() => const BottomNavBar());
            },
            child: Row(
              children: [
                CustomImage(imageSrc: AppImages.logo, size: 25),
                const SizedBox(width: 16),
                Text(
                  AppStrings.appTitle,
                  style: textTheme.titleMedium?.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap:
                onTrailingTap ??
                () {
                  Get.toNamed(AppRoutes.settingsScreens);
                },
            child: CustomImage(imageSrc: trailingIcon ?? AppIcons.bars),
          ),
        ],
      ),
    );
  }
}
