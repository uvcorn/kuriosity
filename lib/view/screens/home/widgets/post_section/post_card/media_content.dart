import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../components/reusable_video_player/reusable_video_player.dart';

class MediaContent extends StatelessWidget {
  final VideoPlayerController? videoController;
  final String? imageUrl;
  final bool isImageLoading;

  const MediaContent({
    super.key,
    this.videoController,
    this.imageUrl,
    required this.isImageLoading,
  });

  @override
  Widget build(BuildContext context) {
    const double aspectRatio = 16 / 9;
    final double mediaWidth = MediaQuery.of(context).size.width - (12 * 2);
    final double calculatedHeight = mediaWidth / aspectRatio;

    if (videoController != null && videoController!.value.isInitialized) {
      return ClipRRect(
        child: ReusableVideoPlayer(
          controller: videoController,
          aspectRatio: aspectRatio,
          width: double.infinity,
          showControls: true,
          enableTapToPlayPause: true,
          enableVolumeControl: true,
        ),
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (isImageLoading) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: calculatedHeight,
            color: AppColors.white,
          ),
        );
      } else {
        return ClipRRect(
          child: CustomNetworkImage(
            imageUrl: imageUrl!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: calculatedHeight,
          ),
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
