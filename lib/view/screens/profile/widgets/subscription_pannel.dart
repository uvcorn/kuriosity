import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';
import '../../group/controller/group_controller.dart';
import '../../group/screens/workshop_details_screen.dart';
import '../controller/attended_workshop_controller.dart';
import 'attended_workshop_card.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../group/models/workshop_model.dart';

class SubscriptionPanel extends StatefulWidget {
  final TextTheme textTheme;
  final bool isPremium;

  const SubscriptionPanel({
    super.key,
    required this.textTheme,
    required this.isPremium,
  });

  @override
  State<SubscriptionPanel> createState() => _SubscriptionPanelState();
}

class _SubscriptionPanelState extends State<SubscriptionPanel> {
  final GroupController groupController = Get.find<GroupController>();

  @override
  Widget build(BuildContext context) {
    final AttendedWorkshopController attendedWorkshopController = Get.put(
      AttendedWorkshopController(),
    );

    return widget.isPremium
        ? Column(
            children: [
              _buildCardBar(
                widget.textTheme,
                AppStrings.attendw,
                AppStrings.viewall,
              ),
              const SizedBox(height: 8),
              Container(
                height: 95,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLightGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Obx(
                  () => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        attendedWorkshopController.attendedWorkshops.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final attendedWorkshop =
                          attendedWorkshopController.attendedWorkshops[index];

                      // Match from allWorkshops instead of currentlyProgressing
                      WorkshopModel? matchedWorkshop = groupController
                          .allWorkshops
                          .firstWhereOrNull((w) => w.id == attendedWorkshop.id);

                      return AttendedWorkshopCard(
                        workshop: attendedWorkshop,
                        onTap: () {
                          if (matchedWorkshop != null) {
                            Get.to(
                              () => WorkshopDetailScreen(
                                workshop: matchedWorkshop,
                              ),
                            );
                          } else {
                            SnackbarHelper.show(
                              isSuccess: false,
                              message:
                                  "Workshop not found or is no longer available.",
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              _buildCardBar(
                widget.textTheme,
                AppStrings.attendw,
                AppStrings.viewall,
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundWhite,
                ),
                child: Center(
                  child: Text(
                    AppStrings.basicUser,
                    style: widget.textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          );
  }

  Widget _buildCardBar(TextTheme textTheme, String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.attendedWorkshopScreen);
          },
          child: Text(actionText, style: textTheme.labelSmall),
        ),
      ],
    );
  }
}
