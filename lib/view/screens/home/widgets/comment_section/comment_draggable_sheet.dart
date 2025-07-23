// comon_post_action_sheet.dart (or wherever CommentDraggableSheet is located)
// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/common_bottom_shit/common_bottom_sheet.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../controllers/comment_controller.dart';
import '../../models/comment_model.dart';
import 'comment_item.dart';

class CommentDraggableSheet extends StatelessWidget {
  final List<Comment> comments;

  const CommentDraggableSheet({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    final CommentController commentController = Get.put(CommentController());
    final textTheme = Theme.of(context).textTheme;

    return CommonBottomSheet(
      title: AppStrings.title,
      showDivider: true,
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      contentBuilder: (context, scrollController) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 5, // widget.comments.length
                itemBuilder: (context, index) {
                  return CommentItem(
                    userImage: AppConstants.profileImage,
                    username: AppStrings.userName,
                    commentText: AppStrings.commentTex,
                    likes: 4,
                    onReplyTapped: commentController.handleReplyTap,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => commentController.replyingTo != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Replying to ${commentController.replyingTo}',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.mediumGray,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close, size: 20),
                                onPressed: commentController.clearReply,
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: commentController.commentController,
                          focusNode: commentController.focusNode,
                          decoration: InputDecoration(
                            hintText: commentController.replyingTo != null
                                ? "Reply to ${commentController.replyingTo}..."
                                : AppStrings.addComment,
                            hintStyle: textTheme.bodySmall,
                            filled: true,
                            fillColor: AppColors.backgroundLightGray,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.sentiment_satisfied_alt_outlined,
                          color: AppColors.gray,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: CustomImage(imageSrc: AppIcons.image),
                        onPressed: () {},
                      ),
                      Obx(() {
                        if (!commentController.hasText) {
                          return SizedBox.shrink(); // hide the send button
                        }
                        return IconButton(
                          onPressed: commentController.sendReply,
                          icon: Icon(Icons.send, color: AppColors.primary),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
