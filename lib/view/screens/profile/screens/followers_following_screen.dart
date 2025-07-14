import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/c_search_bar/c_search_bar.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';

class FollowersFollowingScreen extends StatefulWidget {
  const FollowersFollowingScreen({super.key});

  @override
  State<FollowersFollowingScreen> createState() =>
      _FollowersFollowingScreenState();
}

class _FollowersFollowingScreenState extends State<FollowersFollowingScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          title: CSearchbar(hinttext: AppStrings.searchHint),
          bottom: TabBar(
            tabs: const [
              Tab(text: AppStrings.followers64),
              Tab(text: AppStrings.followings72),
            ],
            indicatorColor: Colors.black,
            labelStyle: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.gray,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  _buildUserList(textTheme, size, isFollower: true),
                  _buildUserList(textTheme, size, isFollower: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList(
    TextTheme textTheme,
    Size size, {
    required bool isFollower,
  }) {
    final itemCount = isFollower ? 6 : 7;

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.001,
          ),
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.06,
                      child: ClipOval(
                        child: CustomNetworkImage(
                          imageUrl: AppConstants.profileImage,
                          height: size.width * 0.12,
                          width: size.width * 0.12,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.userName,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: size.width * 0.04,
                            ),
                          ),
                          Text(
                            AppStrings.userTitle,
                            style: textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              fontSize: size.width * 0.03,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.followButton,
                        style: TextStyle(fontSize: size.width * 0.032),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.16),
                  child: Divider(
                    color: AppColors.lightBorder,
                    thickness: 1,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
