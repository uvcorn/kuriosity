// lib/models/comment_model.dart (or wherever you manage your models)
class Comment {
  final String id;
  final String userImage;
  final String username;
  final String commentText;
  final int likes;

  Comment({
    required this.id,
    required this.userImage,
    required this.username,
    required this.commentText,
    this.likes = 0,
  });
}
