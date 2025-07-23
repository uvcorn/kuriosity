import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../widgets/delete_account_popup.dart';

class PasswordAndSecurityScreen extends StatelessWidget {
  const PasswordAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Column(
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
                AppStrings.passwordandsecurity,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.linkedAccountsScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 8),
                      CustomImage(imageSrc: AppIcons.linkAccount),
                      SizedBox(width: 16),
                      Text(
                        AppStrings.linkedAccounts,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.changePasswordScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 8),
                      CustomImage(imageSrc: AppIcons.padlock),
                      SizedBox(width: 16),
                      Text(
                        AppStrings.changePassword,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.accountDeletion,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  AppStrings.accountDeletiondescep,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) =>
                              const DeleteAccountPopup(),
                        );
                      },
                      child: Text(
                        AppStrings.deleteAccount,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
