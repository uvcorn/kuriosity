import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final TextTheme textTheme;

  const MessageBubble({
    super.key,
    required this.message,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = message.isMe
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    final bgColor = message.isMe
        ? AppColors.primary
        : AppColors.backgroundLightGray;
    final textColor = message.isMe ? AppColors.white : AppColors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            child: Text(
              message.text,
              style: textTheme.bodyMedium?.copyWith(color: textColor),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            DateFormat('h:mm a').format(message.time),
            style: textTheme.bodySmall?.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
