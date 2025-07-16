import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';
import 'participant_avatar_stack.dart';

class WorkshopDetailedContent extends StatelessWidget {
  final String title;
  final String instructorName;
  final String date;
  final List<String> tags;
  final int participants;
  final int spacesLeft;
  final String profileImageUrl;
  final String profileImage2Url;

  const WorkshopDetailedContent({
    super.key,
    required this.title,
    required this.instructorName,
    required this.date,
    required this.tags,
    required this.participants,
    required this.spacesLeft,
    required this.profileImageUrl,
    required this.profileImage2Url,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: AppColors.backgroundWhite,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Row(
              children: [
                CircleAvatar(
                  radius: Get.width * 0.04,
                  child: ClipOval(
                    child: CustomNetworkImage(
                      imageUrl: profileImageUrl,
                      height: Get.width * 0.08,
                      width: Get.width * 0.08,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.02),
                Text(
                  instructorName,
                  style: textTheme.bodySmall?.copyWith(color: AppColors.black),
                ),
              ],
            ),
            Text(
              date,
              style: textTheme.bodySmall?.copyWith(color: AppColors.black),
            ),
            SizedBox(height: Get.height * 0.01),
            Wrap(
              spacing: Get.width * 0.02,
              runSpacing: Get.height * 0.005,
              children: tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag),
                      backgroundColor: AppColors.lightBlueBackground,
                      labelStyle: textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: Get.height * 0.01),
            Row(
              children: [
                ParticipantAvatarStack(
                  participants: participants,
                  profileImage2Url: profileImage2Url,
                ),
                SizedBox(width: Get.width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$participants people joining',
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      spacesLeft == 0
                          ? AppStrings.full
                          : '$spacesLeft space left',
                      style: textTheme.labelSmall?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
