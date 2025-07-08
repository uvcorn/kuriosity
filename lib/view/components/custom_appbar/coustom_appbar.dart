import 'package:flutter/material.dart';
import '../../../utils/app_images/app_images.dart';
import '../custom_image/custom_image.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? iconPath; // SVG icon asset path
  final double iconSize;
  final VoidCallback? onIconTap;
  final Color? backgroundColor;

  const CustomAppbar({
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

    return AppBar(
      elevation: 0,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      title: Row(
        children: [
          CustomImage(imageSrc: AppImages.logo, size: 23),
          const SizedBox(width: 5),
          Text(title, style: textTheme.headlineMedium),
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
