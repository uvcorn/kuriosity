import 'package:flutter/material.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings.dart/app_strings.dart';

class MessageInputField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  const MessageInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: AppColors.backgroundLightGray,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: AppStrings.typeYourMessage,
                    fillColor: AppColors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                  ),
                  onSubmitted: (_) => widget.onSend,
                ),
              ),
              const SizedBox(width: 8.0),
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary,
                child: IconButton(
                  icon: const Icon(Icons.send, color: AppColors.white),
                  onPressed: widget.onSend,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.emoji_emotions)),
              IconButton(onPressed: () {}, icon: Icon(Icons.attachment)),
              IconButton(onPressed: () {}, icon: Icon(Icons.image)),
            ],
          ),
        ],
      ),
    );
  }
}
