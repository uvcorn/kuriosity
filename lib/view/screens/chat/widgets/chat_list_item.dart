import 'package:flutter/material.dart';
import 'package:kuriosity/view/components/custom_image/custom_image.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_network_image/custom_network_image.dart';

class ChatListItem extends StatefulWidget {
  final String userImage;
  final String username;
  final String commentText;
  final int likes;

  const ChatListItem({
    super.key,
    required this.userImage,
    required this.username,
    required this.commentText,
    this.likes = 0,
  });

  @override
  State<ChatListItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<ChatListItem> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
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

          // Message content area
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
                  style: textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),

          // Check icon and time on the far right
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1:20 PM',
                style: textTheme.bodySmall?.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 4),
              CustomImage(imageSrc: AppIcons.check, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
