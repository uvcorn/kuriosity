import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../common/participant_avatar_stack.dart';
import '../common/user_avatar_info_tile.dart';

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

            UserAvatarInfoTile(
              imageUrl: profileImageUrl,
              avatarRadius: Get.width * 0.04,
              infoTexts: [
                Text(
                  instructorName,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.003),
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
                    (tag) => Container(
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueBackground,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          tag,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
