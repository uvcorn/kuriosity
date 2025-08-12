import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/top_app_bar/top_app_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _showCurrentPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.01),
              TopAppBar(),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: Text(
                      AppStrings.changePassword,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01), //

              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildGroupedPasswordField(
                      label: AppStrings.currentPassword,
                      controller: _currentPasswordController,
                      isObscure: !_showCurrentPassword,
                      toggleVisibility: () {
                        setState(() {
                          _showCurrentPassword = !_showCurrentPassword;
                        });
                      },
                    ),
                    Divider(height: 1, color: AppColors.lightBorder),
                    _buildGroupedPasswordField(
                      label: AppStrings.newPassword,
                      controller: _newPasswordController,
                      isObscure: !_showNewPassword,
                      toggleVisibility: () {
                        setState(() {
                          _showNewPassword = !_showNewPassword;
                        });
                      },
                    ),
                    Divider(height: 1, color: AppColors.lightBorder),
                    _buildGroupedPasswordField(
                      label: AppStrings.confirmNewPassword,
                      controller: _confirmPasswordController,
                      isObscure: !_showConfirmPassword,
                      toggleVisibility: () {
                        setState(() {
                          _showConfirmPassword = !_showConfirmPassword;
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.03),

              SizedBox(
                width: double.infinity,
                height: height * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () => Get.back(),
                  child: Text(
                    AppStrings.changePassword,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupedPasswordField({
    required String label,
    required TextEditingController controller,
    required bool isObscure,
    required VoidCallback toggleVisibility,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 65, // consistent height
      child: Padding(
        padding: EdgeInsets.only(top: 12),
        child: TextFormField(
          controller: controller,
          obscureText: isObscure,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            color: AppColors.black,
          ),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: textTheme.bodySmall?.copyWith(
              fontSize: 14,
              color: AppColors.mediumGray,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            suffixIcon: GestureDetector(
              onTap: toggleVisibility,
              child: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: AppColors.mediumGray,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
