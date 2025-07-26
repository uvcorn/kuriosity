import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../group/controller/group_controller.dart';
import '../../group/widgets/workshop/workshop_card.dart';

class SavedWorkshopScreen extends StatefulWidget {
  const SavedWorkshopScreen({super.key});

  @override
  State<SavedWorkshopScreen> createState() => _SavedWorkshopScreenState();
}

class _SavedWorkshopScreenState extends State<SavedWorkshopScreen> {
  final GroupController groupController = Get.find<GroupController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            // Top AppBar Row
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Text(
                    AppStrings.savedWorkshop,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Obx(() {
                  final saved = groupController.savedWorkshops;

                  if (saved.isEmpty) {
                    return Center(
                      child: Text(
                        'No saved workshops yet',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: saved.length,
                    itemBuilder: (context, index) {
                      final workshop = saved[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.workshopDetailScreen,
                            arguments: workshop,
                          );
                        },
                        child: WorkshopCard(
                          title: workshop.title,
                          instructorName: workshop.instructorName,
                          date: workshop.date,
                          tags: workshop.tags,
                          participants: workshop.participants,
                          spacesLeft: workshop.spacesLeft,
                          profileImageUrl: workshop.profileImageUrl,
                          profileImage2Url: workshop.profileImage2Url,
                          fullImageUrls: workshop.fullImageUrls,
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
