import 'package:flutter/material.dart';

import '../../../../../utils/app_colors/app_colors.dart';

class StarDisplay extends StatelessWidget {
  final double rating; // e.g. 4.8
  final double iconSize; // Size of star icons
  final Color color; // Color of the stars
  final bool showValue; // Show "4.8" text next to stars
  final bool useRoundedIcons; // Use rounded star icons

  const StarDisplay({
    super.key,
    required this.rating,
    this.iconSize = 18,
    this.color = AppColors.primary,
    this.showValue = false,
    this.useRoundedIcons = false,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalf = rating - fullStars >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalf ? 1 : 0);

    IconData fullIcon = useRoundedIcons ? Icons.star_rounded : Icons.star;
    IconData halfIcon = useRoundedIcons
        ? Icons.star_half_rounded
        : Icons.star_half;
    IconData emptyIcon = useRoundedIcons
        ? Icons.star_border_rounded
        : Icons.star_border;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          fullStars,
          (_) => Icon(fullIcon, color: color, size: iconSize),
        ),
        if (hasHalf) Icon(halfIcon, color: color, size: iconSize),
        ...List.generate(
          emptyStars,
          (_) => Icon(emptyIcon, color: color, size: iconSize),
        ),
        if (showValue) ...[
          const SizedBox(width: 6),
          Text(
            rating.toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ],
    );
  }
}
