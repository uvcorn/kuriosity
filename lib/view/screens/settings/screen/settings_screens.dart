import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/bottom_nav_bar/bottom_nav_bar.dart';
import '../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';
import '../models/account_item.dart';
import '../widgets/account_section_card.dart';
import '../widgets/faq_expansion.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  bool isPremiumActive = true;

  Future<void> _confirmCancelPremium() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.backgroundWhite,
        title: Text(AppStrings.cancelPremiumUser),
        content: Text(AppStrings.sureBeforeCancelPremium),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              AppStrings.cancel,
              style: TextStyle(color: AppColors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              final BottomNavController navcontroller =
                  Get.find<BottomNavController>();
              navcontroller.changeIndex(0);
              Get.offAll(() => const BottomNavBar());
              SnackbarHelper.show(
                message: AppStrings.premiumSubscriptionCancelled,
                isSuccess: false,
              );
            },
            child: Text(
              AppStrings.yesCancel,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        isPremiumActive = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: Text(
                      AppStrings.settingandActivity,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              AccountSectionCard(
                title: AppStrings.account,
                menuItems: [
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.personalDetailsEditScreen);
                    },
                    title: AppStrings.personaldetails,
                    iconPath: AppIcons.user,
                  ),
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.passwordAndSecurityScreen);
                    },
                    title: AppStrings.passwordandsecurity,
                    iconPath: AppIcons.padlock,
                  ),
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.premiumUserDetailsScreen);
                    },
                    title: AppStrings.becomepremimum,
                    iconPath: AppIcons.premium,
                  ),
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.powerUserDetailsScreen);
                    },
                    title: AppStrings.becomepower,
                    iconPath: AppIcons.power,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              AccountSectionCard(
                title: AppStrings.activity,
                menuItems: [
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.clippedPostScreen);
                    },
                    title: AppStrings.clippedPost,
                    iconPath: AppIcons.clips,
                  ),
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.savedWorkshopScreen);
                    },
                    title: AppStrings.savedWorkshop,
                    iconPath: AppIcons.save,
                  ),
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.ntificationSettingsScreen);
                    },
                    title: AppStrings.notifications,
                    iconPath: AppIcons.blackBell,
                  ),
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.blockedListScreen);
                    },
                    title: AppStrings.blockedList,
                    iconPath: AppIcons.lock,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              AccountSectionCard(
                title: AppStrings.company,
                menuItems: [
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.introductionScreen);
                    },
                    title: AppStrings.introduction,
                    iconPath: AppIcons.user,
                  ),
                  AccountItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.termsAndPolicyScreen);
                    },
                    title: AppStrings.termandPolicy,
                    iconPath: AppIcons.padlock,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  AppStrings.fAQ,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    width * 0.03,
                    height * 0.015,
                    width * 0.03,
                    0,
                  ),
                  child: Column(
                    children: [
                      FaqExpansion(
                        title: AppStrings.personaldetails,
                        description: AppStrings.personaldetailsDescription,
                      ),
                      FaqExpansion(
                        title: AppStrings.passwordandsecurity,
                        description: AppStrings.personaldetailsDescription,
                      ),
                      FaqExpansion(
                        title: AppStrings.becomepremimum,
                        description: AppStrings.personaldetailsDescription,
                      ),
                      FaqExpansion(
                        title: AppStrings.becomepower,
                        description: AppStrings.personaldetailsDescription,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _confirmCancelPremium();
                  },
                  child: Text(
                    AppStrings.cancelPremiumUser,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
