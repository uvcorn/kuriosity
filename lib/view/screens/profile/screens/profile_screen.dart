import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/workshop.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../../../components/custom_image/custom_image.dart';
import '../controller/history_workshop_controller.dart';
import '../controller/host_workshop_controller.dart';
import '../controller/joined_workshop_controller.dart';
import '../controller/profile_controller.dart';
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
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

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
                    Column(
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
                            Container(
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
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        HostCard(
                          workshop: Workshop(
                            title: AppStrings.workshopTitle,
                            time: AppStrings.time,
                            workshopsTime: AppStrings.workshopTime,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    Column(
                      children: [
                        _buildCardBar(textTheme, AppStrings.joiningTitle),
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
                                final workshop = joinedWorkshopController
                                    .joinedWorkshops[index];
                                return JoinWorkshopCard(workshop: workshop);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    Obx(
                      () => buildSubscriptionPannel(
                        textTheme,
                        profileController.isPremium.value,
                      ),
                    ),

                    SizedBox(height: size.height * 0.02),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCardBar(
                          textTheme,
                          AppStrings.historyBarTitle,
                          AppStrings.viewall,
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

  Widget _buildCardBar(TextTheme textTheme, String title, [String? subtitle]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),
        ),
        if (subtitle != null && subtitle.isNotEmpty)
          Text(subtitle, style: textTheme.bodySmall),
      ],
    );
  }
}
