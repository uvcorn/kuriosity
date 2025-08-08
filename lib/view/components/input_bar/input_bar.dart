import 'package:flutter/material.dart';
import 'package:kuriosity/view/components/custom_image/custom_image.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onEmojiTap;
  final VoidCallback onAttachTap;
  final VoidCallback onImageTap;
  final bool hasText;
  const ChatInputBar({
    super.key,
    required this.hasText,
    required this.controller,
    required this.onSend,
    required this.onEmojiTap,
    required this.onAttachTap,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Input box with send button
        Container(
          height: 44, // Fixed height
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    hintText: "Type a message...",
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),

              IconButton(
                icon: Icon(
                  Icons.send_rounded,
                  size: 20,
                  color: hasText ? AppColors.primary : AppColors.mediumGray,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: hasText ? onSend : null, // disable button if no text
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Emoji, Attach, Image icons
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.sentiment_satisfied_alt_outlined),
              onPressed: onEmojiTap,
            ),
            IconButton(
              icon: CustomImage(imageSrc: AppIcons.adddocument),
              onPressed: onAttachTap,
            ),
            IconButton(
              icon: CustomImage(imageSrc: AppIcons.image),
              onPressed: onImageTap,
            ),
          ],
        ),
      ],
    );
  }
}
