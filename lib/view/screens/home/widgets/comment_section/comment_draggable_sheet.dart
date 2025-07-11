// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:kuriosity/utils/app_colors/app_colors.dart';
import 'package:kuriosity/utils/app_const/app_const.dart';
import 'package:kuriosity/utils/app_strings.dart/app_strings.dart';
import 'package:kuriosity/view/screens/home/widgets/comment_section/comment_item.dart';
import 'package:kuriosity/view/components/common_bottom_shit/common_bottom_sheet.dart';
import 'package:kuriosity/view/components/input_bar/input_bar.dart';
import 'comment_model.dart';

class CommentDraggableSheet extends StatefulWidget {
  final List<Comment> comments;

  const CommentDraggableSheet({super.key, required this.comments});

  @override
  State<CommentDraggableSheet> createState() => _CommentDraggableSheetState();
}

class _CommentDraggableSheetState extends State<CommentDraggableSheet> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _commentController.addListener(_onCommentTextChanged);
  }

  void _onCommentTextChanged() {
    setState(() {
      _hasText = _commentController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _commentController.removeListener(_onCommentTextChanged);
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final InputDecoration commonInputDecoration = InputDecoration(
      hintText: AppStrings.addComment,
      hintStyle: textTheme.bodySmall,
      filled: true,
      fillColor: AppColors.backgroundLightGray,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );

    return CommonBottomSheet(
      title: AppStrings.title,
      showDivider: true,
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      contentBuilder: (context, scrollController) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 5, // widget.comments.length
                itemBuilder: (context, index) {
                  return CommentItem(
                    userImage: AppConstants.profileImage,
                    username: AppStrings.userName,
                    commentText: AppStrings.commentTex,
                    likes: 4,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                textController: _commentController,
                focusNode: _focusNode,
                hasText: _hasText,
                onEmojiPressed: () {},
                onImagePressed: () {},
                onSendPressed: () {},
                decoration: commonInputDecoration,
              ),
            ),
          ],
        );
      },
    );
  }
}
