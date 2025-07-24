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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final HomeController _homeController = Get.find<HomeController>();
  final PostController _postController = Get.find<PostController>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    _homeController.toggleSearchBar(_scrollController.offset);
  }

  @override
  Widget build(BuildContext context) {
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
                background: CustomAppbar(
                  iconPath: AppIcons.chat,
                  onIconTap: () => Get.toNamed(AppRoutes.chatsListScreen),
                  backgroundColor: AppColors.backgroundLightGray,
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
                  return PostCard(item: post, followButtom: post.followButton);
                }, childCount: _postController.posts.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
