import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';

class ImageSelectMenu extends StatelessWidget {
  final bool isProfileImage;
  final Function(ImageSource source, {required bool isProfileImage})
  onImagePicked;

  const ImageSelectMenu({
    super.key,
    required this.isProfileImage,
    required this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppStrings.selectImageSource, style: textTheme.bodyLarge),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text(AppStrings.gallery),
            onTap: () {
              Get.back();
              onImagePicked(
                ImageSource.gallery,
                isProfileImage: isProfileImage,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text(AppStrings.camera),
            onTap: () {
              Get.back();
              onImagePicked(ImageSource.camera, isProfileImage: isProfileImage);
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text(AppStrings.cancel),
          ),
        ],
      ),
    );
  }
}
