class Post {
  final String username;
  final String userImage;
  final String? postImage;
  final String? videoUrl;
  final String userSubtitle;
  final String postOverlayText;
  final String caption;
  final String likes;
  final String comments;
  final String seeds;
  final String shares;
  final bool? followButton;
  final bool? isClipedpost;
  final bool? isClimatehistory;
  final bool? isWorkshop;
  final String? workshopTitle;
  final bool isSharedPost;
  final Post? originalPost;
  final String? sharedThought;
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
    this.followButton = false,
    this.isClipedpost = false,
    this.isClimatehistory = false,
    this.isWorkshop = false,
    this.workshopTitle,
    this.isSharedPost = false,
    this.originalPost,
    this.sharedThought,
  });
}
