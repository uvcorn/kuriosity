import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import 'participant_avatar_stack.dart';

class WorkshopParticipationInfo extends StatelessWidget {
  final int participants;
  final String? profileImage2Url;
  final int spacesLeft;

  const WorkshopParticipationInfo({
    super.key,
    required this.participants,
    this.profileImage2Url,
    required this.spacesLeft,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        width: 314,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.backgroundLightGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ParticipantAvatarStack(
                participants: participants,
                profileImage2Url: profileImage2Url!,
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
        ),
      ),
    );
  }
}
