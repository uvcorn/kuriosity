import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/c_search_bar/c_search_bar.dart';
import '../../../components/custom_network_image/custom_network_image.dart';
import '../../../components/top_app_bar/top_app_bar.dart';
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
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ✅ First App Bar (TopAppBar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TopAppBar(),
            ),
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CSearchbar(
                hintText: AppStrings.searchHint,
                background: Colors.transparent,
              ),
            ),
            const SizedBox(height: 8),
            TabBar(
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

            /// ✅ Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Obx(
                    () => followController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : _buildUserList(
                            textTheme,
                            size,
                            followController.followers,
                            true,
                          ),
                  ),
                  Obx(
                    () => followController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : _buildUserList(
                            textTheme,
                            size,
                            followController.following,
                            false,
                          ),
                  ),
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
            // color: AppColors.white,
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
                                // side: const BorderSide(color: AppColors.black),
                                backgroundColor: AppColors.gray,
                              ),
                              child: Text(
                                AppStrings.following,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                followController.toggleFollow(user);
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(95, 32),
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
