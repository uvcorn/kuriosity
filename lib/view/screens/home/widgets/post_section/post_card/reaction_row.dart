// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/custom_image/custom_image.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_icons/app_icons.dart';
import '../../../../../components/reaction_button/reaction_button.dart';

class ReactionRow extends StatelessWidget {
  final RxList<String> reactionIconPaths;

  final String likes;
  final String comments;
  final String seeds;
  final String shares;
  final VoidCallback onReactionIconTap;
  final VoidCallback onReactionCountTap;
  final VoidCallback onCommentTap;
  final VoidCallback onReplanetTap;
  final VoidCallback onShareTap;
  final RxString selectedReactionIconPath;

  const ReactionRow({
    super.key,
    required this.reactionIconPaths,
    required this.likes,
    required this.comments,
    required this.seeds,
    required this.shares,
    required this.onReactionIconTap,
    required this.onReactionCountTap,
    required this.onCommentTap,
    required this.onReplanetTap,
    required this.onShareTap,
    required this.selectedReactionIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onReactionIconTap,
          child: Obx(() {
            final List<String> displayedReactions =
                [
                      selectedReactionIconPath.value,
                      ...reactionIconPaths.where(
                        (icon) => icon != selectedReactionIconPath.value,
                      ),
                    ]
                    .where(
                      (icon) => icon.isNotEmpty,
                    ) // <-- add this to remove empty strings
                    .take(3)
                    .toList()
                    .reversed
                    .toList();

            return Row(
              children: [
                SizedBox(
                  width: (displayedReactions.length - 1) * 16.0 + 28,
                  height: 28,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: List.generate(
                      displayedReactions.length,
                      (i) => Positioned(
                        left: (displayedReactions.length - 1 - i) * 16.0,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.lightBlueBackground,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 2,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: CustomImage(
                              imageSrc: displayedReactions[i],
                              size: 20,
                              imageColor: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                GestureDetector(
                  onTap: onReactionCountTap,
                  child: Text(
                    likes,
                    style: TextStyle(
                      color: AppColors.mediumGray,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        GestureDetector(
          onTap: onCommentTap,
          child: ReactionButton(iconPath: AppIcons.chats, count: comments),
        ),
        GestureDetector(
          onTap: onReplanetTap,
          child: ReactionButton(iconPath: AppIcons.eco, count: seeds),
        ),
        GestureDetector(
          onTap: onShareTap,
          child: ReactionButton(iconPath: AppIcons.share, count: shares),
        ),
      ],
    );
  }
}
