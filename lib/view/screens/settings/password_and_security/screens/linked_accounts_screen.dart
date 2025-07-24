import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
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

  Widget _buildAccountRow(String icon, String accountKey, double width) {
    final textTheme = Theme.of(context).textTheme;
    final isLinked = _linkedAccounts[accountKey] ?? false;

    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.05),
      child: Row(
        children: [
          SizedBox(width: width * 0.02),
          CustomImage(imageSrc: icon),
          SizedBox(width: width * 0.04),
          Expanded(
            child: Text(
              accountKey,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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
                    AppStrings.linkedAccounts,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAccountRow(AppIcons.google, AppStrings.google, width),
                  _buildAccountRow(
                    AppIcons.facebook,
                    AppStrings.facebook,
                    width,
                  ),
                  _buildAccountRow(AppIcons.apple, AppStrings.apple, width),
                  SizedBox(height: height * 0.03),
                  Text(
                    AppStrings.accountDeletion,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    AppStrings.accountDeletiondescep,
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: SizedBox(
                      height: height * 0.06,
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
      ),
    );
  }
}
