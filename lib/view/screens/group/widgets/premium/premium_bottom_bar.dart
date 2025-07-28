// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/snackbar_helper/snackbar_helper.dart';
import '../../controller/auth_controller.dart';
import '../../models/workshop_model.dart';
import '../common/register_button.dart';

class PremiumBottomBar extends StatelessWidget {
  final WorkshopModel workshop;
  const PremiumBottomBar({super.key, required this.workshop});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 80,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightGray.withOpacity(0.3),
          border: Border.all(color: AppColors.lightGray, width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${workshop.participants} people joining',
                  style: textTheme.bodySmall?.copyWith(color: AppColors.black),
                ),
                Text(
                  workshop.spacesLeft == 0
                      ? AppStrings.full
                      : '${workshop.spacesLeft} space left',
                  style: textTheme.labelSmall?.copyWith(color: AppColors.black),
                ),
              ],
            ),

            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 150),
              child: Obx(() {
                final bool isUserRegistered = authController.isRegister.value;
                debugPrint(
                  'Obx rebuilt. isRegister: $isUserRegistered, Workshop Finished: ${workshop.isFinished}',
                );

                if (workshop.isFinished) {
                  return Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      AppStrings.workshopFinished,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else if (isUserRegistered) {
                  return Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      AppStrings.successfulljoin,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return RegisterButton(
                    isFinished: workshop.isFinished,
                    spacesLeft: workshop.spacesLeft,
                    workshopTitle: workshop.title,
                    buttonwidth: 150,
                    buttonhight: 50,
                    onPressed: () {
                      authController.register();
                      SnackbarHelper.show(
                        message: AppStrings.successfulljoin,
                        isSuccess: true,
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
