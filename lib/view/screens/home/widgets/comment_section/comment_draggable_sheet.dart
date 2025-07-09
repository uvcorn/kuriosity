// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import 'comment_item.dart';
import 'comment_model.dart';

class CommentDraggableSheet extends StatefulWidget {
  final List<Comment> comments; // Add this property

  const CommentDraggableSheet({
    super.key,
    required this.comments,
  }); // Update constructor

  @override
  State<CommentDraggableSheet> createState() => _CommentDraggableSheetState();
}

class _CommentDraggableSheetState extends State<CommentDraggableSheet> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DraggableScrollableSheet(
      initialChildSize: 0.60,
      minChildSize: 0.35,
      maxChildSize: 0.95,
      expand: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundLightGray,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 8),
                      child: Container(
                        width: 32,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Comments',
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: AppColors.lightGray,
                indent: 16,
                endIndent: 16,
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CommentItem(
                      userImage: AppConstants.profileImage,
                      username: 'Tony Lens',
                      commentText:
                          'I\'ve got some left red wine in my fridge, does anyone know how to recycle it?',
                      likes: 4,
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          decoration: InputDecoration(
                            hintText: 'Add a comment..',
                            hintStyle: textTheme.bodySmall,
                            filled: true,
                            fillColor: AppColors.backgroundLightGray,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          onTapOutside: (event) {
                            FocusScope.of(
                              context,
                            ).unfocus(); // Dismiss keyboard when tapping outside
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(
                          Icons.sentiment_satisfied_alt_outlined,
                          color: AppColors.gray,
                        ),
                        onPressed: () {
                          // Handle emoji button press
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.image_outlined, color: AppColors.gray),
                        onPressed: () {
                          // Handle image button press
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
