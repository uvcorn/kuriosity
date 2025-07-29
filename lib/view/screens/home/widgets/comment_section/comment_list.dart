import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'comment_item.dart';
import '../../controllers/comment_controller.dart';
import '../../models/comment_model.dart';
import 'dummy_comment.dart';

class CommentList extends StatelessWidget {
  final String? postId;
  final bool scrollable;

  const CommentList({super.key, this.postId, this.scrollable = true});

  @override
  Widget build(BuildContext context) {
    final CommentController commentController = Get.put(CommentController());

    final List<Comment> comments = dummyComments;

    final commentWidgets = comments.map((comment) {
      return CommentItem(
        userImage: comment.userImage,
        username: comment.username,
        commentText: comment.commentText,
        likes: comment.likes,
        onReplyTapped: commentController.handleReplyTap,
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Comment list
        scrollable
            ? SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) => commentWidgets[index],
                ),
              )
            : Column(children: commentWidgets),

        const SizedBox(height: 16),

        // Comment input box
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //   decoration: BoxDecoration(
        //     color: AppColors.white,
        //     boxShadow: [
        //       BoxShadow(
        //         color: AppColors.black.withOpacity(0.05),
        //         spreadRadius: 1,
        //         blurRadius: 5,
        //         offset: const Offset(0, -3),
        //       ),
        //     ],
        //   ),
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Obx(
        //         () => commentController.replyingTo != null
        //             ? Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     'Replying to ${commentController.replyingTo}',
        //                     style: textTheme.bodySmall?.copyWith(
        //                       color: AppColors.mediumGray,
        //                     ),
        //                   ),
        //                   IconButton(
        //                     icon: const Icon(Icons.close, size: 20),
        //                     onPressed: commentController.clearReply,
        //                   ),
        //                 ],
        //               )
        //             : const SizedBox.shrink(),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
