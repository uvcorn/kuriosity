// lib/models/comment_model.dart (or wherever you manage your models)
class Comment {
  final String userImage;
  final String username;
  final String commentText;
  final int likes;

  Comment({
    required this.userImage,
    required this.username,
    required this.commentText,
    this.likes = 0,
  });
}
