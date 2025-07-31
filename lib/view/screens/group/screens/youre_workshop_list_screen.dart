import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/top_app_bar/top_app_bar.dart';
import '../controller/group_controller.dart';
import '../widgets/workshop/workshop_card.dart';

class YoureWorkshopListScreen extends StatefulWidget {
  const YoureWorkshopListScreen({super.key});

  @override
  State<YoureWorkshopListScreen> createState() =>
      _YoureWorkshopListScreenState();
}

class _YoureWorkshopListScreenState extends State<YoureWorkshopListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final GroupController groupController = Get.put(GroupController());

  @override
  void initState() {
    super.initState();
    int initialTab = Get.arguments?['initialTab'] ?? 0;
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: initialTab,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TopAppBar(
                trailingIcon: AppIcons.chat,
                onTrailingTap: () {
                  Get.toNamed(AppRoutes.chatsListScreen);
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back_ios_new, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Your workshops',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: AppColors.backgroundWhite,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                onTap: (_) => setState(() {}), // Triggers rebuild
                tabs: List.generate(3, (index) {
                  final isSelected = _tabController.index == index;
                  final List<String> titles = [
                    'Currently\nprogressing',
                    'Upcoming\nworkshops',
                    'You’re\nHosting',
                  ];

                  return Tab(
                    child: Text(
                      titles[index],
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected ? AppColors.black : AppColors.black,
                      ),
                    ),
                  );
                }),
              ),
            ),

            Expanded(
              child: Container(
                color: AppColors.backgroundLightGray,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _buildCurrentList(textTheme, size),
                            _buildUpcomingList(textTheme, size),
                            _buildYourList(textTheme, size),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentList(TextTheme textTheme, Size size) {
    return Obx(
      () => groupController.currentlyProgressingWorkshops.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'There are currently no \nworkshops in progress',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: groupController.currentlyProgressingWorkshops.length,
              itemBuilder: (context, index) {
                final workshop =
                    groupController.currentlyProgressingWorkshops[index];
                return Padding(
                  // Added Padding here
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ), // 8px bottom padding
                  child: Container(
                    color: AppColors.backgroundLightGray,
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
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildUpcomingList(TextTheme textTheme, Size size) {
    return Obx(
      () => groupController.upcomingWorkshops.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'There are no registered \nworkshops',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: groupController.upcomingWorkshops.length,
              itemBuilder: (context, index) {
                final workshop = groupController.upcomingWorkshops[index];
                return Padding(
                  // Added Padding here
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ), // 8px bottom padding
                  child: Container(
                    color: AppColors.backgroundLightGray,
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
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildYourList(TextTheme textTheme, Size size) {
    return Obx(
      () => groupController.hostedWorkshops.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Only a power user \ncan host workshops',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Become a power user',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: Divider(
                    color: AppColors.primary,
                    thickness: 1,
                    height: 0,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: groupController.hostedWorkshops.length,
              itemBuilder: (context, index) {
                final workshop = groupController.hostedWorkshops[index];
                return Padding(
                  // Added Padding here
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ), // 8px bottom padding
                  child: Container(
                    color: AppColors.backgroundLightGray,
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
                  ),
                );
              },
            ),
    );
  }
}
