// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../controllers/comment_controller.dart';

class CommentInputBar extends StatelessWidget {
  final FocusNode? focusNode;

  const CommentInputBar({super.key, this.focusNode});

  @override
  Widget build(BuildContext context) {
    final CommentController commentController = Get.find();
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Container(
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
                    focusNode: focusNode ?? commentController.focusNode,

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
                    return const SizedBox.shrink();
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
    );
  }
}
