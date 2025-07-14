import 'dart:io';

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
    final isMe = message.isMe;
    final bubbleColor = isMe ? AppColors.primary : AppColors.lightGray;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: bubbleColor, borderRadius: radius),
            child: message.image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(message.image!.path),
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    ),
                  )
                : Text(
                    message.text ?? '',
                    style: textTheme.bodyMedium?.copyWith(
                      color: isMe ? AppColors.white : AppColors.black,
                    ),
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
