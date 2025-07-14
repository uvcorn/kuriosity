// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import '../../../../utils/app_colors/app_colors.dart';

// Updated Message model supporting image and text
class Message {
  final String? text;
  final DateTime time;
  final bool isMe;
  final XFile? image;

  Message({this.text, required this.time, required this.isMe, this.image});
}

// MessageBubble widget to display text or image
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
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
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
                      color: isMe ? Colors.white : Colors.black87,
                    ),
                  ),
          ),
          const SizedBox(height: 4),
          Text(
            _formatTime(message.time),
            style: textTheme.bodySmall?.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final h = time.hour.toString().padLeft(2, '0');
    final m = time.minute.toString().padLeft(2, '0');
    return "$h:$m";
  }
}

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ImagePicker _imagePicker = ImagePicker();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [];
  bool _isCurrentUserSending = true;
  bool _hasText = false;
  bool _isEmojiVisible = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus && _isEmojiVisible) {
      setState(() => _isEmojiVisible = false);
    }
  }

  @override
  void dispose() {
    _messageController.removeListener(_onTextChanged);
    _messageController.dispose();
    _focusNode.removeListener(_onFocusChanged);
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
      _isEmojiVisible = false;
    });

    if (wasFocused) {
      _focusNode.requestFocus();
    }

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _onTapPhotopicker() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        _messages.add(
          Message(
            image: image,
            time: DateTime.now(),
            isMe: _isCurrentUserSending,
          ),
        );
        _isCurrentUserSending = !_isCurrentUserSending;
      });

      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final inputDecoration = InputDecoration(
      hintText: 'Type your message',
      hintStyle: textTheme.bodySmall,
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          titleSpacing: 0,
          title: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => const UserChatMenu(),
              );
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=3',
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'User Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('User Title', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(color: Colors.grey[300], height: 2),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? Center(
                      child: Icon(
                        Icons.chat_bubble_outline,
                        size: 80,
                        color: Colors.grey[300],
                      ),
                    )
                  : ListView.builder(
                      reverse: true,
                      controller: _scrollController,
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
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    onPressed: () {
                      setState(() {
                        _isEmojiVisible = !_isEmojiVisible;
                        if (_isEmojiVisible) {
                          _focusNode.unfocus();
                        } else {
                          _focusNode.requestFocus();
                        }
                      });
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      focusNode: _focusNode,
                      decoration: inputDecoration,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: _onTapPhotopicker,
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _hasText ? _sendMessage : null,
                    color: _hasText ? Colors.blue : Colors.grey,
                  ),
                ],
              ),
            ),
            if (!foundation.kIsWeb) ...[
              Offstage(
                offstage: !_isEmojiVisible,
                child: EmojiPicker(
                  textEditingController: _messageController,
                  scrollController: _scrollController,
                  config: Config(height: 250),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Dummy UserChatMenu to avoid errors (replace with your actual widget)
class UserChatMenu extends StatelessWidget {
  const UserChatMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Center(child: Text('User Chat Menu')),
    );
  }
}
