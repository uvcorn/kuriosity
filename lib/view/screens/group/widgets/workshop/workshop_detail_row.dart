import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../review_Section/star_display.dart';

class WorkshopDetailsRow extends StatelessWidget {
  final String date;
  final List<String> tags;

  const WorkshopDetailsRow({super.key, required this.date, required this.tags});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: textTheme.bodySmall?.copyWith(color: AppColors.black),
                ),
                SizedBox(height: 8),
                Text(
                  'Rate',
                  style: textTheme.bodyMedium?.copyWith(color: AppColors.black),
                ),
              ],
            ),
            Column(
              children: [
                Wrap(
                  spacing: Get.width * 0.015,
                  runSpacing: Get.height * 0.005,
                  children: tags
                      .map(
                        (tag) => SizedBox(
                          height: 30,
                          width: 150,
                          child: Container(
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightBlueBackground,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                '4 week workshop',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.reviewScreen);
                  },
                  child: StarDisplay(
                    rating: 4.8,
                    iconSize: 20,
                    color: AppColors.primary,
                    showValue: true,
                    useRoundedIcons: true,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Rating
      ],
    );
  }
}
