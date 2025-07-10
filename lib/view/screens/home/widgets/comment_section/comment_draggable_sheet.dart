// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';
import '../common_bottom_sheet.dart';
import 'comment_item.dart';
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
      hintText: AppStrings.hintTex,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      minLines: 1,
                      maxLines: 3,
                      controller: _commentController,
                      focusNode: _focusNode,
                      decoration: commonInputDecoration,
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: AppColors.gray,
                    ),
                    onPressed: () {
                      // Handle emoji button press
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.image_outlined,
                      color: AppColors.gray,
                    ),
                    onPressed: () {
                      // Handle image button press
                    },
                  ),
                  const SizedBox(width: 4),
                  if (_hasText)
                    GestureDetector(
                      onTap: () {
                        // Submit comment logic
                        _commentController.clear();
                        _focusNode.unfocus();
                      },
                      child: IconButton(
                        icon: const Icon(Icons.send, color: AppColors.primary),
                        onPressed: () {}, // Disabled when no text
                      ),

                      //  Container(
                      //   height: 35,
                      //   width: 86,
                      //   decoration: BoxDecoration(
                      //     color: AppColors.primary,
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       AppStrings.commentButton,
                      //       style: textTheme.bodySmall?.copyWith(
                      //         color: AppColors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
