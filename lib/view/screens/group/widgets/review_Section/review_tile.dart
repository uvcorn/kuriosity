import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import 'star_display.dart';

class ReviewTile extends StatelessWidget {
  final String name;
  final String date;
  final String review;
  final double rating;
  final String avatarUrl;

  const ReviewTile({
    super.key,
    required this.name,
    required this.date,
    required this.review,
    required this.rating,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(radius: 20, backgroundImage: NetworkImage(avatarUrl)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(date, style: textTheme.bodySmall?.copyWith()),
              ],
            ),
            const Spacer(),
            StarDisplay(rating: 4.2),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          review,
          style: textTheme.bodySmall?.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: 12),
        const Divider(thickness: 0.5),
      ],
    );
  }
}
