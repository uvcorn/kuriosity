import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../../../controllers/post_card_controller.dart';
import '../../comment_section/comment_draggable_sheet.dart';
import '../replanet_menu.dart';
import '../share_menu.dart';
import '../../../models/post_model.dart';
import '../user_menu.dart';
import 'caption_with_link_preview.dart';
import 'media_content.dart';
import 'reaction_options_popup.dart';
import 'reaction_row.dart';
import 'user_info_section.dart';

class PostCard extends StatefulWidget {
  final Post item;
  final bool? followButtom;

  const PostCard({super.key, required this.item, required this.followButtom});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  VideoPlayerController? _videoController;
  bool _isImageLoading = true;

  late final PostCardController _postCardController;

  @override
  void initState() {
    super.initState();
    _postCardController = Get.put(
      PostCardController(),
      tag: widget.item.username + widget.item.caption.hashCode.toString(),
    ); // Use a unique tag

    if (widget.item.videoUrl != null && widget.item.videoUrl!.isNotEmpty) {
      _videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.item.videoUrl!))
            ..initialize().then((_) {
              if (mounted) setState(() {});
            });
    } else if (widget.item.postImage != null &&
        widget.item.postImage!.isNotEmpty) {
      _isImageLoading = true;
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) {
          setState(() {
            _isImageLoading = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    Get.delete<PostCardController>(
      tag: widget.item.username + widget.item.caption.hashCode.toString(),
    ); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final followButton = widget.followButtom ?? false;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserInfoSection(
                username: item.username,
                subtitle: item.userSubtitle,
                profileUrl: item.userImage,
                showFollowButton: followButton,
                onProfileTap: () {
                  Get.find<BottomNavController>().changeIndex(4);
                },
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) => const UserMenu(),
                  );
                },
              ),
              MediaContent(
                videoController: _videoController,
                imageUrl: item.postImage,
                isImageLoading: _isImageLoading,
              ),
              if (item.caption.isNotEmpty)
                CaptionWithLinkPreview(caption: item.caption),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Obx(
                  () => ReactionRow(
                    selectedReactionIconPath:
                        _postCardController.selectedReactionIconPath.value,
                    likes: item.likes,
                    comments: item.comments,
                    seeds: item.seeds,
                    shares: item.shares,
                    onReactionTap: _postCardController.toggleReactionOptions,
                    onCommentTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (_) =>
                            const CommentDraggableSheet(comments: []),
                      );
                    },
                    onReplanetTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) => const ReplanetMenu(),
                      );
                    },
                    onShareTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) => const ShareMenu(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          Obx(
            () => _postCardController.showReactionOptions.value
                ? ReactionOptionsPopup(
                    onSelectReaction: _postCardController.selectReaction,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
