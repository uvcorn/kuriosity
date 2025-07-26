// lib/features/profile/widgets/host_workshop_section.dart (or similar path)
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../group/models/workshop_model.dart';
import '../models/profile_workshop_model.dart';
import 'host_card.dart';

class HostWorkshopSection extends StatelessWidget {
  final ProfileWorkshopModel? hostedProfileWorkshop;
  final WorkshopModel? hostedFullWorkshop;
  const HostWorkshopSection({
    super.key,
    this.hostedProfileWorkshop,
    this.hostedFullWorkshop,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.hostingTitle,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.openNewWorkshopScreen);
              },
              child: Container(
                height: size.height * 0.04,
                width: size.width * 0.26,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImage(
                      imageSrc: AppIcons.health,
                      size: size.width * 0.06,
                    ),
                    SizedBox(width: 6),
                    Text(
                      AppStrings.open,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.02),
        if (hostedProfileWorkshop != null)
          HostCard(
            workshop: hostedProfileWorkshop!,
            fullWorkshopData: hostedFullWorkshop,
          )
        else
          Container(
            height: 48,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.backgroundWhite),
            child: Center(
              child: Text(AppStrings.basicUser, style: textTheme.bodySmall),
            ),
          ),
      ],
    );
  }
}
