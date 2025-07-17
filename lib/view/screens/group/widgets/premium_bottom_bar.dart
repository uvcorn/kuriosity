// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../controller/auth_controller.dart';
import '../models/workshop_model.dart';
import 'register_button.dart';

class PremiumBottomBar extends StatelessWidget {
  final WorkshopModel workshop;
  const PremiumBottomBar({super.key, required this.workshop});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 90,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightGray.withOpacity(0.3),
          border: Border.all(color: AppColors.lightGray, width: 1),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${workshop.participants} people joining',
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        workshop.spacesLeft == 0
                            ? AppStrings.full
                            : '${workshop.spacesLeft} space left',
                        style: textTheme.labelSmall?.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),

                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 150),
                    child: Obx(() {
                      if (authController.isRegister.value) {
                        return Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'You have successfully joined the workshop!',
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
                          buttonhight: 40,
                          onPressed: () {
                            authController.register();
                          },
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
