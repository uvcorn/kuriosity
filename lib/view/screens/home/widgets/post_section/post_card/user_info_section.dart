import 'package:flutter/material.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_strings.dart/app_strings.dart';
import '../../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../more_menu.dart';

class UserInfoSection extends StatelessWidget {
  final String username;
  final String subtitle;
  final String imageUrl;
  final bool showFollowButton;

  const UserInfoSection({
    super.key,
    required this.username,
    required this.subtitle,
    required this.imageUrl,
    required this.showFollowButton,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: ClipOval(
              child: CustomNetworkImage(
                imageUrl: imageUrl,
                height: 60,
                width: 60,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: textTheme.bodyMedium),
                Text(
                  subtitle,
                  style: textTheme.labelSmall?.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
          if (showFollowButton)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.backgroundLightGray,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(AppStrings.followButton, style: textTheme.bodyMedium),
            ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) => const MoreMenu(),
              );
            },
            child: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
