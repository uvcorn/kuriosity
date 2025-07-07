import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/action_button/action_button.dart';
import '../../components/custom_text_field/custom_text_field.dart';
import '../../components/input_card_container/input_card_container.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPassTEController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 106),
                Text(
                  AppStrings.resetPasswordHeader,
                  style: textTheme.titleMedium,
                ),
                SizedBox(height: 10),
                Text(
                  AppStrings.passwordRequirement,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 30),
                InputCardContainer(
                  children: [
                    CustomTextField(
                      controller: _passwordTEController,
                      labelText: AppStrings.newPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isPasswordObscure,
                      enableValidation: true,
                      onToggleObscureText: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                    CustomTextField(
                      controller: _confirmPassTEController,
                      labelText: AppStrings.confirmNewPassword,
                      keyboardType: TextInputType.visiblePassword,
                      confirmPasswordController: _confirmPassTEController,
                      obscureText: _isPasswordObscure,
                      enableValidation: true,
                      onToggleObscureText: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(height: 334),
                ActionButton(
                  title: AppStrings.resetPassword,
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.signInScreen);
                    // if (_formKey.currentState!.validate()) {

                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
