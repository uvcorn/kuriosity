import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../controller/group_controller.dart';
import '../widgets/workshop/workshop_card.dart';

class WorkshopListScreen extends StatefulWidget {
  const WorkshopListScreen({super.key});

  @override
  State<WorkshopListScreen> createState() => _WorkshopListScreenState();
}

class _WorkshopListScreenState extends State<WorkshopListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final GroupController groupController = Get.put(GroupController());
  @override
  void initState() {
    super.initState();

    dynamic args = Get.arguments ?? {};
    int initialTab = args['initialTab'] ?? 0;

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          elevation: 0,
          centerTitle: false,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   'Workshop list',
                //   style: textTheme.bodyMedium?.copyWith(
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                Text(
                  'Your workshops',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Currently \nprogressing',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Upcoming \nworkshops',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'You’re \nHosting',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildCurrentList(textTheme, size),
            _buildUpcomingList(textTheme, size),
            _buildyoureList(textTheme, size),
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
                );
              },
            ),
    );
  }

  Widget _buildyoureList(TextTheme textTheme, Size size) {
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
            ),
    );
  }
}
