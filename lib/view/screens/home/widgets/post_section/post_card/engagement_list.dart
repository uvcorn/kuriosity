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
    };

    // Calculate the total unique users across all reactions
    // We'll use a Set to store unique user identifiers (e.g., name + profilePic)
    // to avoid counting the same user multiple times if they reacted with different types.
    Set<String> uniqueUserIdentifiers = {};
    reactionUsers.values.forEach((list) {
      for (var user in list) {
        uniqueUserIdentifiers.add("${user['name']}-${user['profilePic']}");
      }
    });
    final int totalUniqueUsersCount = uniqueUserIdentifiers.length;

    final List<Map<String, dynamic>> reactions = [
      {
        'key': 'handshake',
        'icon': AppIcons.handshake,
        'color': AppColors.primary,
      },
      {'key': 'clap', 'icon': AppIcons.clap, 'color': AppColors.primary},
      {'key': 'eco', 'icon': AppIcons.globe, 'color': AppColors.primary},
    ];

    // This reactive variable tracks which tab is currently selected.
    // We initialize it to the first tab (index 0).
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
              // Get the list of users for the currently selected reaction
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
                          // Use the totalUniqueUsersCount here
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
                    child: Row(
                      children: reactions.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, dynamic> reaction = entry.value;
                        // Get the count for this specific reaction type
                        final String reactionKey = reaction['key'];
                        final String count =
                            (reactionUsers[reactionKey]?.length ?? 0)
                                .toString();

                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              selectedReactionIndex.value = index;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    // Highlight the border if this tab is selected
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
                                    count, // Display the count specific to this tab
                                    style: textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      // Change text color if this tab is selected
                                      color:
                                          selectedReactionIndex.value == index
                                          ? AppColors.primary
                                          : AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // User list - Now dynamic based on selected tab
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: currentUsers.length, // Use currentUsers.length
                      itemBuilder: (context, index) {
                        final user = currentUsers[index]; // Use currentUsers
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
