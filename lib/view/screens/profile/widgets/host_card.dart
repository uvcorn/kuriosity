// lib/features/profile/widgets/host_card.dart (or similar path)
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';
import '../../group/models/workshop_model.dart';
import '../models/profile_workshop_model.dart';

class HostCard extends StatelessWidget {
  final ProfileWorkshopModel workshop;
  final WorkshopModel?
  fullWorkshopData; // Optional: Pass the full data if available

  const HostCard({
    super.key,
    required this.workshop,
    this.fullWorkshopData, // Constructor now accepts full data
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      // Wrap with GestureDetector for tap
      onTap: () {
        if (fullWorkshopData != null) {
          Get.toNamed(
            AppRoutes.workshopDetailScreen,
            arguments: fullWorkshopData,
          );
        } else {
          SnackbarHelper.show(
            message: 'Full workshop details not available for navigation.',
            isSuccess: true,
          );
        }
      },
      child: Container(
        height: 170,
        width: 350,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
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
      ),
    );
  }
}
