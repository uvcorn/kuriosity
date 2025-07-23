import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../widgets/delete_account_popup.dart';

class LinkedAccountsScreen extends StatefulWidget {
  const LinkedAccountsScreen({super.key});

  @override
  State<LinkedAccountsScreen> createState() => _LinkedAccountsScreenState();
}

class _LinkedAccountsScreenState extends State<LinkedAccountsScreen> {
  final Map<String, bool> _linkedAccounts = {
    AppStrings.google: true,
    AppStrings.facebook: true,
    AppStrings.apple: false,
  };
  void _toggleLink(String account) async {
    final isLinked = _linkedAccounts[account] ?? false;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.backgroundWhite,
        title: Text(
          isLinked ? AppStrings.unlinkAccount : AppStrings.linkAccount,
        ),
        content: Text(
          isLinked ? AppStrings.dialogtitle : AppStrings.dialogopositetitle,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              AppStrings.cancel,
              style: TextStyle(color: AppColors.black),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              AppStrings.confirm,
              style: TextStyle(color: AppColors.black),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        _linkedAccounts[account] = !isLinked;
      });
    }
  }

  Widget _buildAccountRow(String icon, String accountKey) {
    final textTheme = Theme.of(context).textTheme;
    final isLinked = _linkedAccounts[accountKey] ?? false;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          const SizedBox(width: 8),
          CustomImage(imageSrc: icon),
          const SizedBox(width: 16),
          Text(
            accountKey,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => _toggleLink(accountKey),
            child: Text(
              isLinked ? AppStrings.remove : AppStrings.link,
              style: textTheme.bodyMedium?.copyWith(
                color: isLinked ? AppColors.mediumGray : AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
                AppStrings.linkedAccounts,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAccountRow(AppIcons.google, AppStrings.google),
                _buildAccountRow(AppIcons.facebook, AppStrings.facebook),
                _buildAccountRow(AppIcons.apple, AppStrings.apple),
              ],
            ),
          ),
          SizedBox(height: 20),
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
                SizedBox(height: 8),
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
