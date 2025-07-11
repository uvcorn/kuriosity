import 'package:flutter/material.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_strings.dart/app_strings.dart';
import '../../../../../components/custom_netwrok_image/custom_network_image.dart';

class UserInfoSection extends StatelessWidget {
  final String username;
  final String subtitle;
  final String profileUrl;
  final bool? showFollowButton;
  final VoidCallback onTap;
  final VoidCallback? onProfileTap;

  const UserInfoSection({
    super.key,
    required this.username,
    required this.subtitle,
    required this.profileUrl,
    this.showFollowButton = false,
    required this.onTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          InkWell(
            onTap: onProfileTap,
            child: CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: CustomNetworkImage(
                  imageUrl: profileUrl,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: onProfileTap,

                  child: Text(username, style: textTheme.bodyMedium),
                ),
                Text(
                  subtitle,
                  style: textTheme.labelSmall?.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
          if (showFollowButton!)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.backgroundLightGray,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(AppStrings.followButton, style: textTheme.bodyMedium),
            ),
          const SizedBox(width: 8),
          GestureDetector(onTap: onTap, child: const Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
