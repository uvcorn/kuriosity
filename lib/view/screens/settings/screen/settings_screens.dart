import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/view/screens/settings/models/account_item.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
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
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    AppStrings.settingandActivity,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
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
                    onTap: () {},
                    title: AppStrings.passwordandsecurity,
                    iconPath: AppIcons.padlock,
                  ),
                  AccountItem(
                    onTap: () {},
                    title: AppStrings.becomepremimum,
                    iconPath: AppIcons.premium,
                  ),
                  AccountItem(
                    onTap: () {},
                    title: AppStrings.becomepower,
                    iconPath: AppIcons.power,
                  ),
                ],
              ),
              SizedBox(height: 8),
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
              SizedBox(height: 8),
              AccountSectionCard(
                title: AppStrings.company,
                menuItems: [
                  AccountItem(
                    onTap: () {},
                    title: AppStrings.clippedPost,
                    iconPath: AppIcons.user,
                  ),
                  AccountItem(
                    onTap: () {},
                    title: AppStrings.savedWorkshop,
                    iconPath: AppIcons.padlock,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.fAQ,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                // height: calculatedHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
              const SizedBox(height: 30),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  AppStrings.cancelPremiumUser,
                  style: textTheme.bodyMedium?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
