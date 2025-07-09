// post_card.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';

import 'post_model.dart';
import 'reaction_button.dart';
import 'reusable_video_player.dart';

class PostCard extends StatefulWidget {
  final Post item;

  const PostCard({super.key, required this.item});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _showReactionOptions = false;
  late String _selectedReactionIconPath;
  VideoPlayerController? _videoController; // Declare the controller

  @override
  void initState() {
    super.initState();
    _selectedReactionIconPath = AppIcons.handshake;

    // Initialize video controller if a video URL exists
    if (widget.item.videoUrl != null && widget.item.videoUrl!.isNotEmpty) {
      _videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.item.videoUrl!))
            ..initialize().then((_) {
              // Ensure the first frame is shown and play automatically (optional)
              if (mounted) {
                setState(() {});
              }
            });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose(); // Dispose the controller
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

  Widget _reactionIcon(String iconPath) {
    return GestureDetector(
      onTap: () => _selectReaction(iconPath),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomImage(
          imageSrc: iconPath,
          size: 24,
          imageColor: AppColors.mediumGray,
        ),
      ),
    );
  }

  Widget _buildMediaContent() {
    if (widget.item.videoUrl != null && widget.item.videoUrl!.isNotEmpty) {
      if (_videoController == null || !_videoController!.value.isInitialized) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ), // Show loading indicator
        );
      }
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ReusableVideoPlayer(
          controller: _videoController, // <--- Add this line
          aspectRatio: 16 / 9,
          width: double.infinity,
          showControls: true,
          enableTapToPlayPause: true,
          enableVolumeControl: true,
        ),
      );
    } else if (widget.item.postImage != null &&
        widget.item.postImage!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CustomImage(
          imageSrc: widget.item.postImage!,
          fit: BoxFit.cover,
          sizeWidth: double.infinity,
          sizeHeight: 250,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      // backgroundColor: Colors
                      //     .grey[200],
                      child: ClipOval(
                        child: CustomImage(
                          imageSrc: widget.item.userImage,
                          fit: BoxFit.cover,
                          size: 60,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            widget.item.userSubtitle,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLightGray,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Follow',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),

              // Media (Video or Image)
              _buildMediaContent(),

              // Caption
              if (widget.item.caption.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    widget.item.caption,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ),

              // Action Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _toggleReactionOptions,
                      child: ReactionButton(
                        iconPath: _selectedReactionIconPath,
                        count: widget.item.likes,
                        color: AppColors.primary,
                      ),
                    ),
                    ReactionButton(
                      iconPath: AppIcons.chats,
                      count: widget.item.comments,
                    ),
                    ReactionButton(
                      iconPath: AppIcons.eco,
                      count: widget.item.seeds,
                    ),
                    ReactionButton(
                      iconPath: AppIcons.share,
                      count: widget.item.shares,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Reaction Options Overlay
          if (_showReactionOptions)
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _reactionIcon(AppIcons.handshake),
                        _reactionIcon(AppIcons.clap),
                        _reactionIcon(AppIcons.globe),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
