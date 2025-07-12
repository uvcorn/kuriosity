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
    final bool isPremium = true;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(interests: interests),
            const SizedBox(height: 180),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            height: 32,
                            width: 100,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImage(
                                  imageSrc: AppIcons.health,
                                  size: 24,
                                ),
                                Text(
                                  AppStrings.open,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      HostCard(),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      _buildCardBar(textTheme, AppStrings.joiningTitle),
                      const SizedBox(height: 8),
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundLightGray,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemBuilder: (context, index) => JoinWorkshopCard(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  buildSubscriptionPannel(textTheme, isPremium),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCardBar(
                        textTheme,
                        AppStrings.historyBarTitle,
                        AppStrings.viewall,
                      ),
                      SizedBox(height: 8),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
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
