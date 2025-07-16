import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';

class ParticipantAvatarStack extends StatelessWidget {
  final int participants;
  final String profileImage2Url;

  const ParticipantAvatarStack({
    super.key,
    required this.participants,
    required this.profileImage2Url,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double avatarSize = Get.width * 0.08;
          const double overlap = 7;

          final availableWidth = constraints.maxWidth;
          final spacing = avatarSize - overlap;

          int maxAvatars = 0;
          if (spacing > 0 && availableWidth > 0) {
            maxAvatars = ((availableWidth + overlap) / spacing).floor();
          }

          int avatarCount = participants.clamp(0, maxAvatars);

          return SizedBox(
            height: avatarSize,
            width: (avatarCount * spacing + overlap),
            child: Stack(
              clipBehavior: Clip.none,
              children: List.generate(
                avatarCount,
                (index) => Positioned(
                  left: (index * spacing),
                  child: CircleAvatar(
                    radius: avatarSize / 2,
                    child: ClipOval(
                      child: CustomNetworkImage(
                        imageUrl: profileImage2Url,
                        height: avatarSize,
                        width: avatarSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
