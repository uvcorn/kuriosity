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

  bool isOnlyEmoji(String text) {
    final trimmed = text.trim();

    // Emoji regex that supports wide range of emoji
    final emojiRegex = RegExp(
      r'^(?:[\u{1F600}-\u{1F6FF}\u{2600}-\u{27BF}\u{1F300}-\u{1F5FF}\u{1F900}-\u{1F9FF}\u{1FA70}-\u{1FAFF}\u{1F1E6}-\u{1F1FF}])+?$',
      unicode: true,
    );

    return emojiRegex.hasMatch(trimmed);
  }

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final alignment = isMe ? MainAxisAlignment.end : MainAxisAlignment.start;

    final bubbleColor = isMe
        ? AppColors.primary
        : AppColors.backgroundLightGray;
    final textColor = isMe ? AppColors.white : AppColors.black;

    final borderRadius = isMe
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

    final hasText = message.text != null && message.text!.trim().isNotEmpty;
    final isEmojiOnly = hasText && isOnlyEmoji(message.text!);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Row(
            mainAxisAlignment: alignment,
            children: [
              if (message.image != null)
                // 🖼️ Image without bubble
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(message.image!.path),
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                )
              else if (isEmojiOnly)
                // 😃 Emoji only → no bubble
                Text(message.text!, style: const TextStyle(fontSize: 32))
              else if (hasText)
                // ✉️ Text only or Text + emoji → bubble
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: borderRadius,
                  ),
                  child: Text(
                    message.text!,
                    style: textTheme.bodyMedium?.copyWith(color: textColor),
                  ),
                ),
            ],
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
