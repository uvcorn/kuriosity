import 'package:flutter/material.dart';

import '../models/profile_workshop_model.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';

class HistoryWorkshopCard extends StatelessWidget {
  final ProfileWorkshopModel workshop;
  const HistoryWorkshopCard({super.key, required this.workshop});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          workshop.imageUrl != null
              ? ClipRRect(
                  child: CustomNetworkImage(
                    imageUrl: workshop.imageUrl!,
                    height: 100,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                )
              : SizedBox.shrink(),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workshop.title,
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  workshop.time,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
