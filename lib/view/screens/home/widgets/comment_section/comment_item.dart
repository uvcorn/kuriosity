import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/custom_network_image/custom_network_image.dart';
import '../../../../components/reaction_button/reaction_button.dart';
import '../post_section/post_card/engagement_list.dart';

class CommentItem extends StatefulWidget {
  final String userImage;
  final String username;
  final String commentText;
  final int likes;
  final Function(String username) onReplyTapped;

  const CommentItem({
    super.key,
    required this.userImage,
    required this.username,
    required this.commentText,
    this.likes = 0,
    required this.onReplyTapped,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool _showReactionOptions = false;
  late String _selectedReactionIconPath;

  @override
  void initState() {
    super.initState();
    _selectedReactionIconPath = AppIcons.handshake; // Default icon
  }

  void _toggleReactionOptions() {
    setState(() {
      _showReactionOptions = !_showReactionOptions;
    });
  }

  void _selectReaction(String iconPath) {
    setState(() {
      _selectedReactionIconPath = iconPath;
      _showReactionOptions = false;
    });
  }

  Widget _reactionIcon(String iconPath) {
    return GestureDetector(
      onTap: () => _selectReaction(iconPath),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: CircleAvatar(
          radius: 14,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: CustomImage(imageSrc: iconPath, size: 24, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              CircleAvatar(
                radius: 20,
                child: ClipOval(
                  child: CustomNetworkImage(
                    imageUrl: widget.userImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Comment content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and comment text in a bubble
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLightGray,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.username,
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.commentText,
                            style: textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Meta Row
                    Row(
                      children: [
                        // Text(
                        //   '2h ago',
                        //   style: textTheme.labelSmall?.copyWith(
                        //     color: AppColors.black,
                        //   ),
                        // ),
                        // const SizedBox(width: 12),
                        ReactionButton(
                          iconPath: _selectedReactionIconPath,
                          count: widget.likes.toString(),
                          onIconTap: _toggleReactionOptions,
                          onCountTap: () {
                            EngagementList.showEngagementListDialog();
                          },
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => widget.onReplyTapped(widget.username),
                          child: Text(
                            AppStrings.replybutton,
                            style: textTheme.labelSmall?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Reaction popup
        if (_showReactionOptions)
          Positioned(
            bottom: 0,
            left: 72,
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _reactionIcon(AppIcons.handshake),
                    _reactionIcon(AppIcons.clap),
                    _reactionIcon(AppIcons.globe),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
