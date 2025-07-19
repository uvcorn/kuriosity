// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_const/app_const.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/c_search_bar/c_search_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          CSearchbar(hinttext: AppStrings.searchHint),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              AppStrings.notifications,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return _buildNotificationItem(
                  context,
                  AppStrings.userName,
                  AppStrings.notificationsdetails,

                  AppStrings.notifitime,
                  profileImageUrl: AppConstants.profile2Image,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    String primaryText,
    String secondaryText,
    String time, {
    bool isNew = false,
    String? profileImageUrl,
    bool isWorkshop = false,
  }) {
    return Container(
      color: isNew ? AppColors.primary.withOpacity(0.05) : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            backgroundImage: profileImageUrl != null
                ? NetworkImage(profileImageUrl)
                : null,
            child: profileImageUrl == null
                ? (isWorkshop
                      ? const Icon(Icons.factory_outlined, color: Colors.grey)
                      : const Icon(Icons.person, color: Colors.grey))
                : null,
          ),
          const SizedBox(width: 12),
          // Notification Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black87,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: primaryText,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' $secondaryText',
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Time Ago
          Text(
            time,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
