import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/c_search_bar/c_search_bar.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';
import '../controller/followers_following_controller.dart';

class FollowersFollowingScreen extends StatefulWidget {
  const FollowersFollowingScreen({super.key});

  @override
  State<FollowersFollowingScreen> createState() =>
      _FollowersFollowingScreenState();
}

class _FollowersFollowingScreenState extends State<FollowersFollowingScreen>
    with TickerProviderStateMixin {
  final FollowersFollowingController followController = Get.put(
    FollowersFollowingController(),
  );

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    int initialTab = Get.arguments?['initialTab'] ?? 0;
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: initialTab,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          elevation: 0,
          centerTitle: false,
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.zero,
            child: CSearchbar(hinttext: AppStrings.searchHint),
          ),
          bottom: TabBar(
            controller: _tabController,
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
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          Obx(
            () => followController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : _buildUserList(
                    textTheme,
                    size,
                    followController.followers,
                    true,
                  ),
          ),
          Obx(
            () => followController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : _buildUserList(
                    textTheme,
                    size,
                    followController.following,
                    false,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserList(
    TextTheme textTheme,
    Size size,
    RxList<User> users,
    bool isFollower,
  ) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
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
                            user.name,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            user.title,
                            style: textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => user.isFollowing.value
                          ? OutlinedButton(
                              onPressed: () {
                                followController.toggleFollow(user);
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.black),
                              ),
                              child: Text(
                                AppStrings.following,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                followController.toggleFollow(user);
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(95, 32),
                              ),
                              child: Text(
                                AppStrings.followButton,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
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
