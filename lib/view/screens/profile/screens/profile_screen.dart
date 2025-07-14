import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../widgets/history_card.dart';
import '../widgets/host_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/join_workshop_card.dart';
import '../widgets/subscription_pannel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> interests = ['Fashion', 'Upcycling', 'Dining Out'];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final bool isPremium = true;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(interests: interests),

            // Use relative height instead of fixed 180
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
                            height:
                                size.height * 0.04, // ~32 on 800 height screen
                            width:
                                size.width * 0.26, // ~100 on 390 width screen
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImage(
                                  imageSrc: AppIcons.health,
                                  size: size.width * 0.06, // 24 at 400 width
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
                      HostCard(),
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
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: size.width * 0.03),
                          itemBuilder: (context, index) => JoinWorkshopCard(),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.02),

                  buildSubscriptionPannel(textTheme, isPremium),

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
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        separatorBuilder: (_, __) =>
                            SizedBox(height: size.height * 0.01),
                        itemBuilder: (context, index) => HistoryCard(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
