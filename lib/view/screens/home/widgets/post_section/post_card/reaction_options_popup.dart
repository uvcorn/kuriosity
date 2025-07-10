import 'package:flutter/material.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_icons/app_icons.dart';
import '../../../../../components/custom_image/custom_image.dart';

class ReactionOptionsPopup extends StatelessWidget {
  final void Function(String iconPath) onSelectReaction;

  const ReactionOptionsPopup({super.key, required this.onSelectReaction});

  Widget _reactionIcon(String iconPath) {
    return GestureDetector(
      onTap: () => onSelectReaction(iconPath),
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

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
    );
  }
}
