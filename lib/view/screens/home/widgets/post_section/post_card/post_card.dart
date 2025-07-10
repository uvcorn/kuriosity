import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../utils/app_icons/app_icons.dart';
import '../../comment_section/comment_draggable_sheet.dart';
import '../replanet_menu.dart';
import '../share_menu.dart';
import '../post_model.dart';
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
  bool _showReactionOptions = false;
  late String _selectedReactionIconPath;
  VideoPlayerController? _videoController;
  bool _isImageLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedReactionIconPath = AppIcons.handshake;

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
    super.dispose();
  }

  void _toggleReactionOptions() {
    setState(() {
      _showReactionOptions = !_showReactionOptions;
    });
  }

  void _selectReaction(String iconPath) {
    setState(() {
      _selectedReactionIconPath = iconPath;
      _showReactionOptions = false;
    });
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
                imageUrl: item.userImage,
                showFollowButton: followButton,
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
                child: ReactionRow(
                  selectedReactionIconPath: _selectedReactionIconPath,
                  likes: item.likes,
                  comments: item.comments,
                  seeds: item.seeds,
                  shares: item.shares,
                  onReactionTap: _toggleReactionOptions,
                  onCommentTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const CommentDraggableSheet(comments: []),
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
            ],
          ),

          if (_showReactionOptions)
            ReactionOptionsPopup(onSelectReaction: _selectReaction),
        ],
      ),
    );
  }
}
