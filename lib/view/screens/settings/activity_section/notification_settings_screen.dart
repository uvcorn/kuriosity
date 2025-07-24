import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool generalNotifications = true;
  bool workshopNotifications = true;
  bool followNotifications = true;
  bool messageNotifications = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            // Top AppBar Row
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  // const SizedBox(width: 8),
                  Text(
                    AppStrings.notifications,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildSwitchTile(
                    title: AppStrings.generalNotifications,
                    subtitle: AppStrings.generalNotificationsSub,
                    value: generalNotifications,
                    onChanged: (val) {
                      setState(() {
                        generalNotifications = val;
                      });
                    },
                  ),
                  _buildSwitchTile(
                    title: AppStrings.workshopNotifications,
                    subtitle: AppStrings.workshopNotificationsSub,
                    value: workshopNotifications,
                    onChanged: (val) {
                      setState(() {
                        workshopNotifications = val;
                      });
                    },
                  ),
                  _buildSwitchTile(
                    title: AppStrings.followNotifications,
                    subtitle: AppStrings.followNotificationsSub,
                    value: followNotifications,
                    onChanged: (val) {
                      setState(() {
                        followNotifications = val;
                      });
                    },
                  ),
                  _buildSwitchTile(
                    title: AppStrings.messageNotifications,
                    subtitle: AppStrings.messageNotificationsSub,
                    value: messageNotifications,
                    onChanged: (val) {
                      setState(() {
                        messageNotifications = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        title,
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      value: value,
      activeColor: AppColors.white,
      activeTrackColor: AppColors.primary,
      inactiveThumbColor: AppColors.black,
      inactiveTrackColor: AppColors.lightBlueBackground,
      onChanged: onChanged,
    );
  }
}
