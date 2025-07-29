import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/top_app_bar/top_app_bar.dart';
import '../../home/controllers/post_controller.dart';
import '../../home/widgets/post_section/post_card/post_card.dart';

class ClippedPostScreen extends StatefulWidget {
  const ClippedPostScreen({super.key});

  @override
  State<ClippedPostScreen> createState() => _ClippedPostScreenState();
}

class _ClippedPostScreenState extends State<ClippedPostScreen> {
  final PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TopAppBar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Get.back(),
                  ),
                  Text(
                    AppStrings.clippedPost,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Obx(() {
                  final clippedPosts = postController.posts
                      .where((post) => post.isClipedpost == true)
                      .toList();

                  if (clippedPosts.isEmpty) {
                    return Center(
                      child: Text(
                        AppStrings.blankClippedPosts,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: clippedPosts.length,
                    itemBuilder: (context, index) {
                      final post = clippedPosts[index];
                      return PostCard(
                        item: post,
                        followButton: post.followButton,
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
