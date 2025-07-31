import 'package:flutter/material.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../components/custom_network_image/custom_network_image.dart';

class UserInfoSection extends StatelessWidget {
  final String username;
  final String? subtitle;
  final String? profileUrl;
  final bool showFollowButton;
  final VoidCallback onProfileTap;
  final VoidCallback onTap;
  final bool isFollowing;
  final VoidCallback onFollowTap;
  const UserInfoSection({
    super.key,
    required this.username,
    this.subtitle,
    this.profileUrl,
    required this.showFollowButton,
    required this.onProfileTap,
    required this.onTap,
    this.isFollowing = false,
    required this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CustomNetworkImage(
                    imageUrl: profileUrl ?? '',
                    size: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty)
                      Text(
                        subtitle!,
                        style: textTheme.labelSmall?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          if (showFollowButton)
            GestureDetector(
              onTap: onFollowTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),

                child: Text(
                  isFollowing ? 'Following' : 'Follow',
                  style: TextStyle(
                    color: isFollowing ? AppColors.gray : AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onTap,
            child: const Icon(Icons.more_horiz, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
