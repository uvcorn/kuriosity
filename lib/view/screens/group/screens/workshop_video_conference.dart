// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../widgets/common/participants_dialog.dart';

class WorkshopVideoConference extends StatefulWidget {
  const WorkshopVideoConference({super.key});

  @override
  State<WorkshopVideoConference> createState() =>
      _WorkshopVideoConferenceState();
}

class _WorkshopVideoConferenceState extends State<WorkshopVideoConference> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.backgroundLightGray,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.keyboard_arrow_left),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        AppStrings.conferencetitle,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        AppStrings.conferencelength,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.chatsScreen);
                    },
                    icon: CustomImage(imageSrc: AppIcons.chat),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ParticipantsDialog(),
                      );
                    },
                    icon: CustomImage(imageSrc: AppIcons.users),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.video_call_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.workshopFinishScreen);
              },
              icon: Icon(Icons.next_plan_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
