// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_const/app_const.dart';
import '../../../../../../utils/app_strings/app_strings.dart';
import '../../../../../../utils/app_icons/app_icons.dart';
import '../../../../../components/custom_image/custom_image.dart';
import '../../../../../components/custom_network_image/custom_network_image.dart';

class EngagementList {
  static Future<void> showEngagementListDialog() async {
    final textTheme = Theme.of(Get.context!).textTheme;

    // Data structure to hold users for each reaction type
    final Map<String, List<Map<String, String>>> reactionUsers = {
      'handshake': [
        {'name': 'Sarah Johnson', 'profilePic': AppConstants.profileImage},
        {'name': 'David Lee', 'profilePic': AppConstants.profile2Image},
        {'name': 'Anna White', 'profilePic': AppConstants.profileImage},
        {'name': 'Tom Brown', 'profilePic': AppConstants.profile2Image},
        {'name': 'Lily Green', 'profilePic': AppConstants.profileImage},
      ],
      'clap': [
        {'name': 'Mike Chen', 'profilePic': AppConstants.profile2Image},
        {'name': 'Olivia Kim', 'profilePic': AppConstants.profileImage},
        {'name': 'Jake Miller', 'profilePic': AppConstants.profile2Image},
      ],
      'eco': [
        {'name': 'Emma Davis', 'profilePic': AppConstants.profileImage},
        {'name': 'Alex Rodriguez', 'profilePic': AppConstants.profile2Image},
        {'name': 'Lisa Wang', 'profilePic': AppConstants.profileImage},
        {'name': 'Chris Evans', 'profilePic': AppConstants.profile2Image},
        {'name': 'Sophia Hall', 'profilePic': AppConstants.profileImage},
        {'name': 'Daniel Clark', 'profilePic': AppConstants.profile2Image},
        {'name': 'Mia Lewis', 'profilePic': AppConstants.profileImage},
      ],
      // Adding new reactions (Facebook-like)
      'like': [
        // Using 'like' key for generic thumbs up
        {'name': 'Ethan Harris', 'profilePic': AppConstants.profileImage},
        {'name': 'Chloe Adams', 'profilePic': AppConstants.profile2Image},
      ],
      'heart': [
        {'name': 'Grace Taylor', 'profilePic': AppConstants.profileImage},
        {'name': 'Noah Wilson', 'profilePic': AppConstants.profile2Image},
        {'name': 'Aria Clark', 'profilePic': AppConstants.profileImage},
      ],
      'laugh': [
        {'name': 'Liam King', 'profilePic': AppConstants.profile2Image},
        {'name': 'Zoe Wright', 'profilePic': AppConstants.profileImage},
      ],
      'wow': [
        // 'Wow' reaction
        {'name': 'Owen Moore', 'profilePic': AppConstants.profileImage},
        {'name': 'Ava Scott', 'profilePic': AppConstants.profile2Image},
      ],
      'sad': [
        {'name': 'Samuel Green', 'profilePic': AppConstants.profileImage},
      ],
      'angry': [
        {'name': 'Hannah Baker', 'profilePic': AppConstants.profile2Image},
      ],
    };

    Set<String> uniqueUserIdentifiers = {};
    for (var list in reactionUsers.values) {
      for (var user in list) {
        uniqueUserIdentifiers.add("${user['name']}-${user['profilePic']}");
      }
    }
    final int totalUniqueUsersCount = uniqueUserIdentifiers.length;

    final List<Map<String, dynamic>> reactions = [
      {
        'key': 'handshake',
        'icon': AppIcons.handshake,
        'color': AppColors.primary,
      },
      {'key': 'clap', 'icon': AppIcons.clap, 'color': AppColors.primary},
      {'key': 'eco', 'icon': AppIcons.globe, 'color': AppColors.primary},
      // Adding new reaction icons - replace with actual paths in AppIcons
    ];

    RxInt selectedReactionIndex = 0.obs;

    await showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundWhite,
          surfaceTintColor: AppColors.backgroundWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 24.0,
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Obx(() {
              final String selectedReactionKey =
                  reactions[selectedReactionIndex.value]['key'];
              final List<Map<String, String>> currentUsers =
                  reactionUsers[selectedReactionKey] ?? [];

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${AppStrings.engagement} ($totalUniqueUsersCount)",
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Reaction types row (Tabs)
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.lightGray,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      // Added SingleChildScrollView for horizontal scroll if many reactions
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: reactions.asMap().entries.map((entry) {
                          int index = entry.key;
                          Map<String, dynamic> reaction = entry.value;
                          final String reactionKey = reaction['key'];
                          final String count =
                              (reactionUsers[reactionKey]?.length ?? 0)
                                  .toString();

                          return GestureDetector(
                            onTap: () {
                              selectedReactionIndex.value = index;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ), // Adjusted padding
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: selectedReactionIndex.value == index
                                        ? AppColors.primary
                                        : Colors.transparent,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImage(
                                    imageSrc: reaction['icon'],
                                    size: 20,
                                    imageColor: reaction['color'],
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    count,
                                    style: textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          selectedReactionIndex.value == index
                                          ? AppColors.primary
                                          : AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  // User list -
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: currentUsers.length,
                      itemBuilder: (context, index) {
                        final user = currentUsers[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: AppColors.lightGray,
                                child: ClipOval(
                                  child: CustomNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: user['profilePic']!,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                user['name']!,
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }), // End of Obx
          ),
        );
      },
    );
  }
}
