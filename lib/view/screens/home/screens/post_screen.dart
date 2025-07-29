import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/top_app_bar/top_app_bar.dart';
import '../models/post_model.dart';
import '../widgets/comment_section/comment_input_bar.dart';
import '../widgets/comment_section/comment_list.dart';
import '../widgets/post_section/post_card/post_card.dart';

class PostScreen extends StatelessWidget {
  final Post post;

  const PostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TopAppBar(),
            ),
            // const SizedBox(height: 8),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     children: [
            //       IconButton(
            //         icon: const Icon(Icons.arrow_back_ios),
            //         onPressed: () => Get.back(),
            //       ),
            //       Text(
            //         AppStrings.post,
            //         style: textTheme.bodyMedium?.copyWith(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 4),
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                // padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostCard(
                      item: post,
                      followButton: true,
                      hideReactions: false,
                      isNested: false,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    CommentList(scrollable: false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const CommentInputBar(),
    );
  }
}
