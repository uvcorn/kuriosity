// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kuriosity/view/components/custom_image/custom_image.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_const/app_const.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/input_bar/input_bar.dart';
import '../home/widgets/post_section/post_card/user_info_section.dart';
import 'user_chat_menu.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _hasText = false;

  // final List<Map<String, dynamic>> _messages = [
  //   {
  //     'message':
  //         'So proud of our little garden this year! With all the rain and all of the bugs 🪴',
  //     'time': '12:23 AM',
  //     'isSender': false,
  //   },
  // ];

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _messageController.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final InputDecoration tInputDecoration = InputDecoration(
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              builder: (BuildContext context) => const UserChatMenu(),
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(color: AppColors.lightBorder, height: 2),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.backgroundWhite,
              width: double.infinity,
              child: CustomImage(imageSrc: AppIcons.emptychat),
            ),
          ),

          //bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                onSendPressed: () {
                  _messageController.clear();
                },
                decoration: tInputDecoration,
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
