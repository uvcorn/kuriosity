import '../../../../utils/app_icons/app_icons.dart';

class Post {
  final String id;
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
  final List<String> reactedReactions;
  final String? selectedReactionIcon;
  Post({
    required this.id,
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
    this.reactedReactions = const [AppIcons.handshake],
    this.selectedReactionIcon,
  });
}
