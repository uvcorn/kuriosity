import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../../../../group/controller/group_controller.dart';
import '../../../controllers/post_card_controller.dart';
import '../../comment_section/comment_draggable_sheet.dart';
import '../replanet_menu.dart';
import '../share_menu.dart';
import '../../../models/post_model.dart';
import '../user_menu.dart';
import 'caption_with_link_preview.dart';
import 'engagement_list.dart';
import 'media_content.dart';
import 'reaction_options_popup.dart';
import 'reaction_row.dart';
import 'user_info_section.dart';
import 'workshop_bar.dart';
import 'package:video_player/video_player.dart';

class PostCard extends StatefulWidget {
  final Post item;
  final bool? followButton;
  final bool isNested;
  final bool hideReactions;
  final bool showAsCard; // NEW

  const PostCard({
    super.key,
    required this.item,
    this.followButton,
    this.isNested = false,
    this.hideReactions = false,
    this.showAsCard = true,
  });

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
    );

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
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final followButton = widget.followButton ?? false;

    final content = Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.isWorkshop == true && item.workshopTitle != null)
              WorkshopBar(
                title: item.workshopTitle!,
                onTap: () {
                  final workshop = Get.find<GroupController>().filteredWorkshops
                      .firstWhere((w) => w.id == '1');
                  Get.toNamed(
                    AppRoutes.workshopDetailScreen,
                    arguments: workshop,
                  );
                },
              ),

            // User Info Row
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
                  builder: (_) => const UserMenu(),
                );
              },
            ),

            // Shared post logic
            if (item.isSharedPost && item.originalPost != null) ...[
              if (item.sharedThought != null && item.sharedThought!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: Text(
                    item.sharedThought!,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: PostCard(
                    item: item.originalPost!,
                    followButton: false,
                    isNested: true,
                    hideReactions: true,
                  ),
                ),
              ),
            ] else ...[
              MediaContent(
                videoController: _videoController,
                imageUrl: item.postImage,
                isImageLoading: _isImageLoading,
              ),
              if (item.caption.isNotEmpty)
                CaptionWithLinkPreview(caption: item.caption),
            ],

            if (!widget.hideReactions)
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
                    onReactionIconTap:
                        _postCardController.toggleReactionOptions,
                    onReactionCountTap: () {
                      EngagementList.showEngagementListDialog();
                    },
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
                        builder: (_) => const ReplanetMenu(),
                      );
                    },
                    onShareTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const ShareMenu(),
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
    );

    return GestureDetector(
      onTap: () {
        if (!widget.isNested &&
            !Get.currentRoute.contains(AppRoutes.postScreen)) {
          Get.toNamed(AppRoutes.postScreen, arguments: item);
        }
      },
      child: widget.showAsCard
          ? Card(
              color: AppColors.white,
              margin: widget.isNested
                  ? const EdgeInsets.fromLTRB(8, 4, 8, 8)
                  : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.isNested ? 8 : 12),
                side: widget.isNested
                    ? const BorderSide(color: AppColors.lightBorder)
                    : BorderSide.none,
              ),
              elevation: widget.isNested ? 0 : 2,
              child: Padding(
                padding: widget.isNested
                    ? const EdgeInsets.symmetric(horizontal: 0, vertical: 8)
                    : const EdgeInsets.all(0),
                child: content,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: content,
            ),
    );
  }
}
