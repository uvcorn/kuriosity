import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class HostCard extends StatelessWidget {
  const HostCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 170,
      width: 350,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.workshopTitle,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              AppStrings.time,
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            Container(
              height: 30,
              width: 135,
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.lightBlueBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  AppStrings.workshopTime,
                  style: textTheme.bodySmall?.copyWith(color: AppColors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
