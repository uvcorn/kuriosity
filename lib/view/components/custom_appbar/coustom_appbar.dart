import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_images/app_images.dart';
import '../custom_image/custom_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? iconPath; // SVG icon asset path
  final double iconSize;
  final VoidCallback? onIconTap;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title = 'Wild Curiosity',
    this.iconPath,
    this.iconSize = 24,
    this.onIconTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRoutes.bottomNavBar);
            },
            child: Row(
              children: [
                CustomImage(imageSrc: AppImages.logo, size: 23),
                const SizedBox(width: 5),
                Text(title, style: textTheme.headlineMedium),
              ],
            ),
          ),
          const Spacer(),
          // Optional icon button if iconPath is provided
          if (iconPath != null)
            GestureDetector(
              onTap: onIconTap,
              child: CustomImage(
                imageSrc: iconPath!,
                sizeWidth: iconSize,
                sizeHeight: iconSize,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
