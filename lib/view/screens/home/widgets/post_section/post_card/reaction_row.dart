import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/custom_image/custom_image.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_icons/app_icons.dart';
import '../../../../../components/reaction_button/reaction_button.dart';

class ReactionRow extends StatelessWidget {
  final List<String> reactionIconPaths;
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
        const SizedBox(width: 0),
        GestureDetector(
          onTap: onReactionIconTap,
          child: Obx(() {
            // Make sure selected reaction is first, followed by others (no repeats)
            final List<String> displayedReactions = [
              selectedReactionIconPath.value,
              ...reactionIconPaths.where(
                (icon) => icon != selectedReactionIconPath.value,
              ),
            ].take(3).toList();

            return Row(
              children: [
                SizedBox(
                  width:
                      28.0 +
                      ((displayedReactions.length - 1).clamp(0, 2)) * 20.0,
                  height: 28.0,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      for (
                        int i = 0;
                        i < displayedReactions.length && i < 3;
                        i++
                      )
                        Positioned(
                          left: i * 20.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: CustomImage(
                              imageSrc: displayedReactions[i],
                              size: 24,
                              imageColor: AppColors.primary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onReactionCountTap,
                  child: Text(
                    likes,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
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
