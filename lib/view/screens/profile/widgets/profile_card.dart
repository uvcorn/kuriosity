import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';

class ProfileCard extends StatelessWidget {
  final List<String> interests;

  const ProfileCard({super.key, required this.interests});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.userName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              CustomImage(imageSrc: AppIcons.power),
            ],
          ),
        ),
        Text(AppStrings.userTitle),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                AppStrings.followButton,
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.chatsScreen);
              },
              child: CustomImage(imageSrc: AppIcons.chat),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(color: AppColors.lightGray),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStat(textTheme, AppStrings.num, AppStrings.post),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.followersFollowingScreen),
              child: _buildStat(
                textTheme,
                AppStrings.num,
                AppStrings.followers,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(
                AppRoutes.followersFollowingScreen,
                arguments: {'initialTab': 1},
              ),
              child: _buildStat(
                textTheme,
                AppStrings.num,
                AppStrings.following,
              ),
            ),
          ],
        ),
        const Divider(color: AppColors.lightGray),
        const SizedBox(height: 4),
        Text(AppStrings.userBio, style: textTheme.bodyMedium),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              AppStrings.goal,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(AppStrings.userGoal, style: textTheme.bodyMedium),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.interest,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: interests.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        interests[index],
                        style: textTheme.labelSmall?.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStat(TextTheme textTheme, String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
