import 'package:flutter/material.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_image/custom_image.dart';

class ReactionButton extends StatelessWidget {
  final String iconPath;
  final String count;
  final Color? color;

  const ReactionButton({
    super.key,
    required this.iconPath,
    required this.count,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        CustomImage(
          imageSrc: iconPath,
          size: 24,
          imageColor: color ?? AppColors.mediumGray,
        ),
        const SizedBox(width: 4),
        Text(count, style: textTheme.labelSmall),
      ],
    );
  }
}
