// lib/screens/home/widgets/post_model.dart
// import 'link_metadata.dart'; // Import the new LinkMetadata class

class Post {
  final String username;
  final String userImage;
  final String? postImage;
  final String? videoUrl; // nullable video URL
  final String userSubtitle;
  final String postOverlayText;
  final String caption;
  final String likes;
  final String comments;
  final String seeds;
  final String shares;
  // final LinkMetadata? linkPreview; // NEW: Nullable link preview data

  Post({
    required this.username,
    required this.userImage,
    this.postImage,
    this.videoUrl,
    required this.userSubtitle,
    required this.postOverlayText,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.seeds,
    required this.shares,
    // this.linkPreview, // NEW: Add to constructor
  });
}
