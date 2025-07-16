import 'package:flutter/material.dart';

import '../models/profile_workshop_model.dart';
import '../../../../utils/app_colors/app_colors.dart';

class HostCard extends StatelessWidget {
  final ProfileWorkshopModel workshop;
  const HostCard({super.key, required this.workshop});

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
              workshop.title,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              workshop.time,
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            if (workshop.workshopsTime != null)
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
                    workshop.workshopsTime!,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
