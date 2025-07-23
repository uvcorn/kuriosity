import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/view/screens/settings/models/account_item.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../widgets/account_section_card.dart';
import '../widgets/faq_expansion.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
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
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                      Get.toNamed(AppRoutes.editProfileScreen);
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
                    onTap: () {},
                    title: AppStrings.clippedPost,
                    iconPath: AppIcons.clips,
                  ),
                  AccountItem(
                    onTap: () {},
                    title: AppStrings.savedWorkshop,
                    iconPath: AppIcons.save,
                  ),
                  AccountItem(
                    onTap: () {},
                    title: AppStrings.notifications,
                    iconPath: AppIcons.blackBell,
                  ),
                  AccountItem(
                    onTap: () {},
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
                    onTap: () {},
                    title: AppStrings.introduction,
                    iconPath: AppIcons.user,
                  ),
                  AccountItem(
                    onTap: () {},
                    title: AppStrings.savedWorkshop,
                    iconPath: AppIcons.padlock,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Text(
                AppStrings.fAQ,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
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
                child: Text(
                  AppStrings.cancelPremiumUser,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    decoration: TextDecoration.underline,
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
