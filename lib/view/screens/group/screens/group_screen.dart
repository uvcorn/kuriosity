import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/c_search_bar/c_search_bar.dart';
import '../controller/group_controller.dart';
import '../widgets/common/category_selector.dart';
import '../widgets/workshop/workshop_card.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final GroupController controller = Get.put(GroupController());

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CSearchbar(hinttext: AppStrings.searchWorkshophint),

              const SizedBox(height: 16),
              Obx(
                () => CategorySelector(
                  topCategories: controller.topCategories,
                  selectedTopCategoryIndex: controller.selectedTopCategoryIndex,
                  onCategorySelected: (index) {
                    controller.selectedTopCategoryIndex = index;
                  },
                ),
              ),

              const Divider(color: AppColors.lightGray),
              Expanded(
                child: Obx(() {
                  final filteredList = controller.filteredWorkshops;
                  if (filteredList.isEmpty) {
                    return const Center(child: Text(AppStrings.noworkshop));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final workshop = filteredList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: GestureDetector(
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
                            isFinished: workshop.isFinished,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(
            AppRoutes.wrkshopListScreen,
            arguments: {'initialTab': 0},
          );
        },
        label: Text(
          AppStrings.gotoyourworkshop,
          style: textTheme.bodySmall?.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
