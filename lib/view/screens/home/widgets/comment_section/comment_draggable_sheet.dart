import 'package:flutter/material.dart';

import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/common_bottom_shit/common_bottom_sheet.dart';
import '../../models/comment_model.dart';
import 'comment_input_bar.dart';
import 'comment_list.dart';

class CommentDraggableSheet extends StatelessWidget {
  final List<Comment> comments;

  const CommentDraggableSheet({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheet(
      title: AppStrings.comments,
      showDivider: true,
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      contentBuilder: (context, scrollController) {
        final bottomInset = MediaQuery.of(context).viewInsets.bottom;

        return Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: const [CommentList(scrollable: false)],
                ),
              ),
              const CommentInputBar(),
            ],
          ),
        );
      },
    );
  }
}
