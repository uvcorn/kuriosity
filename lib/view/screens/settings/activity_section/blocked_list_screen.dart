import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class BlockedListScreen extends StatefulWidget {
  const BlockedListScreen({super.key});

  @override
  State<BlockedListScreen> createState() => _BlockedListScreenState();
}

class _BlockedListScreenState extends State<BlockedListScreen> {
  List<Map<String, String>> blockedUsers = [
    {'name': AppStrings.userName, 'tagline': AppStrings.userTitle},
    {'name': AppStrings.userName, 'tagline': AppStrings.userTitle},
    {'name': AppStrings.userName, 'tagline': AppStrings.userTitle},
    {'name': AppStrings.userName, 'tagline': AppStrings.userTitle},
  ];

  Future<void> _confirmUnblock(int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.backgroundWhite,
        title: Text(AppStrings.unblockUser),
        content: Text(AppStrings.unblockSurety),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              AppStrings.cancel,
              style: TextStyle(color: AppColors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: true);
              SnackbarHelper.show(message: AppStrings.unblockSuccessfully);
            },
            child: Text(
              AppStrings.unblock,
              style: TextStyle(color: AppColors.black),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        blockedUsers.removeAt(index);
      });
    }
  }

  Widget _buildBlockedUserTile(int index, double width) {
    final user = blockedUsers[index];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: ClipOval(
              child: CustomNetworkImage(
                imageUrl: AppConstants.profileImage,
                size: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['name'] ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  user['tagline'] ?? '',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => _confirmUnblock(index),
            child: Text(AppStrings.unblock),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    // final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: Text(
                      AppStrings.blockedList,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: blockedUsers.isEmpty
                      ? const Center(child: Text(AppStrings.noblockedusers))
                      : ListView.builder(
                          itemCount: blockedUsers.length,
                          itemBuilder: (context, index) =>
                              _buildBlockedUserTile(index, width),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
