// lib/view/screens/home/widgets/post_section/post_card/reaction_row.dart

import 'package:flutter/material.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_icons/app_icons.dart';
import '../../../../../components/reaction_button/reaction_button.dart';

class ReactionRow extends StatelessWidget {
  final String selectedReactionIconPath;
  final String likes;
  final String comments;
  final String seeds;
  final String shares;

  final VoidCallback onReactionIconTap;
  final VoidCallback onReactionCountTap;
  final VoidCallback onCommentTap;
  final VoidCallback onReplanetTap;
  final VoidCallback onShareTap;

  const ReactionRow({
    super.key,
    required this.selectedReactionIconPath,
    required this.likes,
    required this.comments,
    required this.seeds,
    required this.shares,
    required this.onReactionIconTap,
    required this.onReactionCountTap,
    required this.onCommentTap,
    required this.onReplanetTap,
    required this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: ReactionButton(
            iconPath: selectedReactionIconPath,
            count: likes,
            color: AppColors.primary,
            onIconTap: onReactionIconTap,
            onCountTap: onReactionCountTap,
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: onCommentTap,
            child: ReactionButton(iconPath: AppIcons.chats, count: comments),
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: onReplanetTap,
            child: ReactionButton(iconPath: AppIcons.eco, count: seeds),
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: onShareTap,
            child: ReactionButton(iconPath: AppIcons.share, count: shares),
          ),
        ),
      ],
    );
  }
}
