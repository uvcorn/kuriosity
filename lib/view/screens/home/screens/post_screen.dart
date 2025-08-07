import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/top_app_bar/top_app_bar.dart';
import '../controllers/post_card_controller.dart';
import '../models/post_model.dart';
import '../widgets/comment_section/comment_input_bar.dart';
import '../widgets/comment_section/comment_list.dart';
import '../widgets/post_section/post_card/post_card.dart';
import '../widgets/post_section/post_card/engagement_list.dart';
import '../widgets/post_section/post_card/reaction_row.dart';
import '../widgets/post_section/replanet_menu.dart';
import '../widgets/post_section/share_menu.dart';

class PostScreen extends StatelessWidget {
  final Post post;

  PostScreen({super.key, required this.post});
  final FocusNode _commentFocusNode = FocusNode();
  PostCardController get _postCardController => Get.find<PostCardController>(
    tag: post.username + post.caption.hashCode.toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TopAppBar(),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostCard(
                      item: post,
                      followButton: true,
                      hideReactions: true,
                      isNested: false,
                      showAsCard: false,
                    ),
                    const SizedBox(height: 20),
                    const Divider(height: 1),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Obx(
                        () => ReactionRow(
                          selectedReactionIconPath: _postCardController
                              .selectedReactionIconPath
                              .value,
                          likes: post.likes,
                          comments: post.comments,
                          seeds: post.seeds,
                          shares: post.shares,
                          onReactionIconTap:
                              _postCardController.toggleReactionOptions,
                          onReactionCountTap: () {
                            EngagementList.showEngagementListDialog();
                          },
                          onCommentTap: () {
                            _commentFocusNode.requestFocus();
                          },
                          onReplanetTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (_) => const ReplanetMenu(),
                            );
                          },
                          onShareTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (_) => const ShareMenu(),
                            );
                          },
                        ),
                      ),
                    ),
                    const Divider(height: 1),
                    const SizedBox(height: 8),
                    const CommentList(scrollable: false),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomSheet: CommentInputBar(focusNode: _commentFocusNode),
    );
  }
}
