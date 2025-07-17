import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';

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
                          child: Chip(
                            label: Text(tag),
                            backgroundColor: AppColors.lightBlueBackground,
                            labelStyle: textTheme.bodySmall?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.primary,
                      size: Get.width * 0.045,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.primary,
                      size: Get.width * 0.045,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.primary,
                      size: Get.width * 0.045,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.primary,
                      size: Get.width * 0.045,
                    ),
                    Icon(
                      Icons.star_half_rounded,
                      color: AppColors.primary,
                      size: Get.width * 0.045,
                    ),
                    SizedBox(width: Get.width * 0.01),
                    Text(
                      "4.8", // Display actual rating value
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
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
