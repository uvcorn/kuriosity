// lib/controllers/comment_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CommentController extends GetxController {
  final TextEditingController commentController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final RxBool _hasText = false.obs;
  bool get hasText => _hasText.value;

  final RxnString _replyingTo = RxnString();
  String? get replyingTo => _replyingTo.value;

  @override
  void onInit() {
    super.onInit();
    commentController.addListener(_onCommentTextChanged);
  }

  void _onCommentTextChanged() {
    _hasText.value = commentController.text.trim().isNotEmpty;
  }

  void handleReplyTap(String username) {
    _replyingTo.value = username;
    focusNode.requestFocus();
  }

  void sendReply() {
    final replyText = commentController.text.trim();
    if (replyText.isEmpty) return;

    _replyingTo.value = null;
    commentController.clear();
    focusNode.unfocus();
  }

  void clearReply() {
    _replyingTo.value = null;
    commentController.clear();
    focusNode.unfocus();
  }

  @override
  void onClose() {
    commentController.removeListener(_onCommentTextChanged);
    commentController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
