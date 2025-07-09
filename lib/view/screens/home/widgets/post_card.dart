// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:video_player/video_player.dart';

// NEW imports for linkify & preview
import 'package:linkify/linkify.dart';
import 'package:any_link_preview/any_link_preview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';

import 'comment_draggable_sheet.dart';
import 'post_model.dart';
import 'reaction_button.dart';
import 'reusable_video_player.dart';

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

  Widget _buildCaptionWithLinkPreview(String caption) {
    // Extract links using linkify
    final linkElements = linkify(
      caption,
    ).whereType<LinkableElement>().cast<LinkableElement>().toList();

    // Extract first URL if exists
    final firstUrl = linkElements.isNotEmpty ? linkElements.first.url : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Caption with clickable links
        Padding(
          padding: const EdgeInsets.all(8),
          child: Linkify(
            text: caption,
            onOpen: (link) async {
              final url = Uri.parse(link.url);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                // Could not launch URL
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Could not open the link')),
                );
              }
            },
            style: const TextStyle(fontSize: 14, height: 1.5),
            linkStyle: const TextStyle(color: Colors.blue),
          ),
        ),

        // Show preview if URL exists
        if (firstUrl != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AnyLinkPreview(
              link: firstUrl,
              cache: const Duration(hours: 1),
              displayDirection: UIDirection.uiDirectionHorizontal,
              showMultimedia: true,
              bodyMaxLines: 3,
              bodyTextOverflow: TextOverflow.ellipsis,
              errorBody: 'Could not load preview',
              errorTitle: 'Invalid URL',
              errorWidget: Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(8),
                child: const Text('Failed to load link preview'),
              ),
              borderRadius: 12,
              removeElevation: true,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                              color: AppColors.black,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.followButtom!)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundLightGray,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Follow', style: textTheme.bodyMedium),
                      ),
                    const SizedBox(width: 8),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),

              // Media (Video or Image)
              _buildMediaContent(),

              // UPDATED: Caption with link preview
              if (widget.item.caption.isNotEmpty)
                _buildCaptionWithLinkPreview(widget.item.caption),

              // Action Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
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
                    GestureDetector(
                      onTap: () => _showCommentsBottomSheet(context),
                      child: ReactionButton(
                        iconPath: AppIcons.chats,
                        count: widget.item.comments,
                      ),
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

  void _showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      backgroundColor: Colors.transparent, // Optional: to blend background
      builder: (_) => const CommentDraggableSheet(comments: []),
    );
  }
}
