// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';
import '../../../../components/common_bottom_shit/common_bottom_sheet.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../models/comment_model.dart';
import 'comment_item.dart';

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
  String? _replyingTo;

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

  void _handleReplyTap(String username) {
    setState(() {
      _replyingTo = username;
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  void _sendReply() {
    final replyText = _commentController.text.trim();
    if (replyText.isEmpty) return;

    setState(() {
      _replyingTo = null;
      _commentController.clear();
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
                    onReplyTapped: _handleReplyTap, // <- Use this!
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_replyingTo != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Replying to $_replyingTo',
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, size: 20),
                          onPressed: () {
                            setState(() {
                              _replyingTo = null;
                              _commentController.clear();
                              FocusScope.of(context).unfocus();
                            });
                          },
                        ),
                      ],
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            hintText: _replyingTo != null
                                ? "Reply to $_replyingTo..."
                                : AppStrings.addComment,
                            hintStyle: textTheme.bodySmall,
                            filled: true,
                            fillColor: AppColors.backgroundLightGray,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),

                      IconButton(
                        icon: const Icon(
                          Icons.sentiment_satisfied_alt_outlined,
                          color: AppColors.gray,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: CustomImage(imageSrc: AppIcons.image),
                        onPressed: () {},
                      ),
                      IconButton(
                        onPressed: _sendReply,
                        icon: Icon(
                          Icons.send,
                          color: _hasText
                              ? AppColors.primary
                              : AppColors.mediumGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
