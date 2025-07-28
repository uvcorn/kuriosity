import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../group/controller/group_controller.dart';
import '../../group/models/workshop_model.dart';
import '../../group/screens/workshop_details_screen.dart';
import '../models/profile_workshop_model.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../controller/history_workshop_controller.dart';
import '../controller/host_workshop_controller.dart';
import '../controller/joined_workshop_controller.dart';
import '../controller/profile_controller.dart';
import '../widgets/card_bar.dart';
import '../widgets/history_workshop_card.dart';
import '../widgets/host_workshop_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/join_workshop_card.dart';
import '../widgets/subscription_pannel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final JoinedWorkshopController joinedWorkshopController = Get.put(
    JoinedWorkshopController(),
  );
  final HostWorkshopController hostWorkshopController = Get.put(
    HostWorkshopController(),
  );
  final HistoryWorkshopController historyWorkshopController = Get.put(
    HistoryWorkshopController(),
  );
  final BottomNavController navController = Get.find<BottomNavController>();
  final ProfileController profileController = Get.put(ProfileController());
  final GroupController groupController = Get.find<GroupController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    final ProfileWorkshopModel? hostedProfileWorkshop =
        hostWorkshopController.hostWorkshops.isNotEmpty
        ? hostWorkshopController.hostWorkshops.first
        : null;
    final WorkshopModel? hostedFullWorkshop =
        groupController.hostedWorkshops.isNotEmpty
        ? groupController.hostedWorkshops.first
        : null;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        navController.backToHome();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundLightGray,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => ProfileHeader(
                  interests: profileController.interests.toList(),
                ),
              ),
              SizedBox(height: size.height * 0.22),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HostWorkshopSection(
                      hostedProfileWorkshop: hostedProfileWorkshop,
                      hostedFullWorkshop: hostedFullWorkshop,
                    ),

                    SizedBox(height: size.height * 0.02),

                    Column(
                      children: [
                        CardBar(
                          textTheme: textTheme,
                          title: AppStrings.joiningTitle,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundLightGray,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(
                            () => ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: joinedWorkshopController
                                  .joinedWorkshops
                                  .length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: size.width * 0.03),
                              itemBuilder: (context, index) {
                                final joinedWorkshop = joinedWorkshopController
                                    .joinedWorkshops[index];

                                WorkshopModel? matchedWorkshop;
                                try {
                                  matchedWorkshop = groupController
                                      .currentlyProgressingWorkshops
                                      .firstWhere(
                                        (w) =>
                                            w.title == joinedWorkshop.title &&
                                            w.date == joinedWorkshop.time,
                                      );
                                } catch (_) {
                                  matchedWorkshop = null;
                                }

                                return JoinWorkshopCard(
                                  workshop: joinedWorkshop,
                                  onTap: () {
                                    if (matchedWorkshop != null) {
                                      Get.to(
                                        () => WorkshopDetailScreen(
                                          workshop: matchedWorkshop!,
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    Obx(
                      () => SubscriptionPanel(
                        textTheme: Theme.of(context).textTheme,
                        isPremium: profileController.isPremium.value,
                        // profileController.isPremium.value,
                      ),
                    ),

                    SizedBox(height: size.height * 0.02),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardBar(
                          textTheme: textTheme,
                          title: AppStrings.historyBarTitle,
                          subtitle: AppStrings.viewall,
                          vieallTap: () {
                            Get.toNamed(AppRoutes.yourClimateHistoryscreen);
                          },
                        ),
                        SizedBox(height: size.height * 0.01),
                        Obx(
                          () => ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: historyWorkshopController
                                .historyWorkshops
                                .length,
                            separatorBuilder: (_, __) =>
                                SizedBox(height: size.height * 0.01),
                            itemBuilder: (context, index) {
                              final workshop = historyWorkshopController
                                  .historyWorkshops[index];
                              return HistoryWorkshopCard(workshop: workshop);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
