import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_netwrok_image/custom_network_image.dart';

class WorkshopImageContent extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String instructorName;
  final String profileImageUrl;

  const WorkshopImageContent({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.instructorName,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CustomNetworkImage(
          imageUrl: imageUrl,
          height: Get.height * 0.3,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Row(
                children: [
                  CircleAvatar(
                    radius: Get.width * 0.035,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: CustomNetworkImage(
                        imageUrl: profileImageUrl,
                        height: Get.width * 0.07,
                        width: Get.width * 0.07,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.02),
                  Text(
                    instructorName,
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
