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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.1), // ~10% of screen height
                  Text(
                    AppStrings.resetPasswordHeader,
                    style: textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.015),
                  Text(
                    AppStrings.passwordRequirement,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.04),
                  InputCardContainer(
                    minHeight: 116,
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
                  SizedBox(height: size.height * 0.4),
                  ActionButton(
                    title: AppStrings.resetPassword,
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.signInScreen);
                      // if (_formKey.currentState!.validate()) {
                      //   // Perform reset password logic
                      // }
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ), // optional bottom padding
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
