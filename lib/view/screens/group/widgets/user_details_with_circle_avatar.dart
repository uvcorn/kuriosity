import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_netwrok_image/custom_network_image.dart';
import '../screens/workshop_details_screen.dart';

class UserdetailswithCircleAvatar extends StatelessWidget {
  const UserdetailswithCircleAvatar({
    super.key,
    required this.widget,
    required this.textTheme,
  });

  final WorkshopDetailScreen widget;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: Get.width * 0.045,
          child: ClipOval(
            child: CustomNetworkImage(
              imageUrl: widget.workshop.profileImageUrl,
              size: Get.width * 0.09,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        Text(
          widget.workshop.instructorName,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
