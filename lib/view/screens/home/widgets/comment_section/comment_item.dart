import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/custom_network_image/custom_network_image.dart';
import '../../../../components/reaction_button/reaction_button.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomImage(
          imageSrc: iconPath,
          size: 24,
          imageColor: AppColors.mediumGray,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedReactionIconPath = AppIcons.handshake; // Default
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                child: ClipOval(
                  child: CustomNetworkImage(
                    imageUrl: widget.userImage,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.commentText,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _toggleReactionOptions,
                          child: ReactionButton(
                            iconPath: _selectedReactionIconPath,
                            count: widget.likes.toString(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => widget.onReplyTapped(widget.username),
                          child: Text(
                            AppStrings.replybutton,
                            style: textTheme.labelSmall,
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
