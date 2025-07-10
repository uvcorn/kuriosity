import 'package:flutter/material.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_netwrok_image/custom_network_image.dart';

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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar and Comment Body
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
                    Text(widget.commentText, style: textTheme.bodySmall),
                    const SizedBox(height: 8),
                  ],
                ),
              ),

              Text(
                '1:20 PM',
                style: textTheme.bodySmall?.copyWith(color: AppColors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
