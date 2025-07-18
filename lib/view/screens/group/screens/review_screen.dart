import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../widgets/review_Section/review_tile.dart';
import '../widgets/review_Section/star_display.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {
        "name": "Emma",
        "date": "Feb 2025",
        "rating": 4.0,
        "text":
            "We were only sad not to stay longer. We hope to be back to explore Nantes some more and would love to stay at Golwen’s place again, if they’ll have us! :)",
      },
      {
        "name": "Craig",
        "date": "Feb 2025",
        "rating": 4.0,
        "text":
            "We were only sad not to stay longer. We hope to be back to explore Nantes some more and would love to stay at Golwen’s place again, if they’ll have us! :)",
      },
      {
        "name": "Cheri",
        "date": "Feb 2025",
        "rating": 4.0,
        "text":
            "We were only sad not to stay longer. We hope to be back to explore Nantes some more and would love to stay at Golwen’s place again, if they’ll have us! :)",
      },
    ];
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.reviews,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    AppStrings.reviewbardesc,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    StarDisplay(
                      rating: 4.8,
                      iconSize: 20,
                      color: AppColors.primary,
                      showValue: true,
                      useRoundedIcons: true,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "12 reviews",
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            for (var review in reviews)
              ReviewTile(
                name: review['name'] as String,
                date: review['date'] as String,
                rating: review['rating'] as double,
                avatarUrl: AppConstants.profile2Image,
                review: review['text'] as String,
              ),
          ],
        ),
      ),
    );
  }
}
