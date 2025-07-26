import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/custom_network_image/custom_network_image.dart';

class UserAvatarInfoTile extends StatelessWidget {
  final String imageUrl;
  final double? avatarRadius;
  final List<Widget>? infoTexts;
  final double spacing;

  const UserAvatarInfoTile({
    super.key,
    required this.imageUrl,
    this.avatarRadius,
    this.infoTexts,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final double radius = avatarRadius ?? Get.width * 0.045;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: radius,
              child: ClipOval(
                child: CustomNetworkImage(
                  imageUrl: imageUrl,
                  size: radius * 2,
                  width: radius * 2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: spacing),
            if (infoTexts != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: infoTexts!.map((widget) {
                    if (widget is Text) {
                      return Text(
                        (widget.data ?? ''),
                        style: widget.style,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      );
                    }
                    return widget;
                  }).toList(),
                ),
              ),
          ],
        );
      },
    );
  }
}
