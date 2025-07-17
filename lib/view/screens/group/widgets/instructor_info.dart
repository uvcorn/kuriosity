import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_netwrok_image/custom_network_image.dart';

class InstructorInfo extends StatelessWidget {
  final String instructorName;
  final String profileImageUrl;

  const InstructorInfo({
    super.key,
    required this.instructorName,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        CircleAvatar(
          radius: Get.width * 0.045,
          child: ClipOval(
            child: CustomNetworkImage(
              imageUrl: profileImageUrl,
              size: Get.width * 0.09,
              width: Get.width * 0.09,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        Text(
          instructorName,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
