import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';

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

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    AppStrings.changePassword,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Current Password
              _buildPasswordField(
                label: AppStrings.currentPassword,
                controller: _currentPasswordController,
                isObscure: !_showCurrentPassword,
                toggleVisibility: () {
                  setState(() {
                    _showCurrentPassword = !_showCurrentPassword;
                  });
                },
              ),

              const SizedBox(height: 12),

              // New Password
              _buildPasswordField(
                label: AppStrings.newPassword,
                controller: _newPasswordController,
                isObscure: !_showNewPassword,
                toggleVisibility: () {
                  setState(() {
                    _showNewPassword = !_showNewPassword;
                  });
                },
              ),

              const SizedBox(height: 12),

              _buildPasswordField(
                label: AppStrings.confirmNewPassword,
                controller: _confirmPasswordController,
                isObscure: !_showConfirmPassword,
                toggleVisibility: () {
                  setState(() {
                    _showConfirmPassword = !_showConfirmPassword;
                  });
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 48,
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

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool isObscure,
    required VoidCallback toggleVisibility,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: textTheme.labelSmall,
        suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
          onPressed: toggleVisibility,
        ),
        filled: true,
        fillColor: AppColors.white,

        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.mediumGray, width: 2.0),
        ),
      ),
    );
  }
}
