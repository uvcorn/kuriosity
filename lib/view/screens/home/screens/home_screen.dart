import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_appbar/coustom_appbar.dart';
import '../controllers/home_controller.dart';
import '../controllers/post_controller.dart';
import '../delegates/search_bar_delegater.dart';
import '../widgets/post_section/post_card/post_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _homeController = Get.find<HomeController>();
  final _postController = Get.find<PostController>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      _homeController.toggleSearchBar(_scrollController.offset);
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: false,
              expandedHeight: 50,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomAppBar(
                    iconPath: AppIcons.chat,
                    onIconTap: () => Get.toNamed(AppRoutes.chatsListScreen),
                    backgroundColor: AppColors.backgroundLightGray,
                  ),
                ),
              ),
            ),

            Obx(
              () => _homeController.showSearchBar.value
                  ? SliverPersistentHeader(
                      pinned: true,
                      delegate: SearchBarDelegate(),
                    )
                  : const SliverToBoxAdapter(child: SizedBox.shrink()),
            ),

            Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final post = _postController.posts[index];
                  return PostCard(
                    item: post,
                    followButton: post.followButton,
                    isFromPostScreen: true,
                  );
                }, childCount: _postController.posts.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
