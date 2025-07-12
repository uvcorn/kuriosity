// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/input_bar/input_bar.dart';
import '../../home/widgets/post_section/post_card/user_info_section.dart';
import '../widgets/message_bubble.dart';
import '../models/message_model.dart';
import '../widgets/user_chat_menu.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<Message> _messages = [];
  bool _isCurrentUserSending = true;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _messageController.removeListener(_onTextChanged);
    _messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _messageController.text.trim().isNotEmpty;
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    final wasFocused = _focusNode.hasFocus;

    Future.microtask(() {
      setState(() {
        _messages.add(
          Message(
            text: _messageController.text.trim(),
            time: DateTime.now(),
            isMe: _isCurrentUserSending,
          ),
        );
        _isCurrentUserSending = !_isCurrentUserSending;
        _messageController.clear();
      });

      if (wasFocused) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final inputDecoration = InputDecoration(
      hintText: AppStrings.typeYourMessage,
      hintStyle: textTheme.bodySmall,
      filled: true,
      fillColor: AppColors.backgroundLightGray,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          toolbarHeight: 80,
          titleSpacing: 0,
          title: UserInfoSection(
            username: AppStrings.userName,
            subtitle: AppStrings.userTitle,
            profileUrl: AppConstants.profileImage,
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => const UserChatMenu(),
              );
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(color: AppColors.lightBorder, height: 2),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? Center(child: CustomImage(imageSrc: AppIcons.emptychat))
                  : ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[_messages.length - 1 - index];
                        return MessageBubble(
                          message: message,
                          textTheme: textTheme,
                        );
                      },
                    ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: InputBar(
                textController: _messageController,
                focusNode: _focusNode,
                hasText: _hasText,
                onEmojiPressed: () {},
                onAttachPressed: () {},
                onImagePressed: () {},
                onSendPressed: _sendMessage,
                decoration: inputDecoration,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
