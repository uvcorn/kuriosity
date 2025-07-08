import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_theme/app_theme.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/action_button/action_button.dart';
import '../../components/custom_checkbox/custom_checkbox.dart';
import '../../components/custom_text_field/custom_text_field.dart';
import '../../components/input_card_container/input_card_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPassTEController =
      TextEditingController();
  bool _isPasswordObscure = true;
  bool _agreedToTerms = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 67),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(AppStrings.welcomeHere, style: textTheme.titleLarge),
                  Text(AppStrings.createAccount, style: textTheme.titleLarge),
                  SizedBox(height: 10),
                  Text(AppStrings.fillInformation, style: textTheme.bodyLarge),
                ],
              ),
              SizedBox(height: 34),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InputCardContainer(
                      children: [
                        CustomTextField(
                          controller: _firstNameTEController,
                          labelText: AppStrings.firstName,
                        ),
                        CustomTextField(
                          controller: _lastNameTEController,
                          labelText: AppStrings.lastName,
                        ),
                        CustomTextField(
                          controller: _emailTEController,
                          labelText: AppStrings.lastName,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          controller: _passwordTEController,
                          labelText: AppStrings.password,
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
                          labelText: AppStrings.confirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _isPasswordObscure,
                          enableValidation: true,
                          confirmPasswordController: _confirmPassTEController,
                          onToggleObscureText: () {
                            setState(() {
                              _isPasswordObscure = !_isPasswordObscure;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomCheckbox(
                showCheckbox: true,
                value: _agreedToTerms,
                onChanged: (newValue) {
                  setState(() {
                    _agreedToTerms = newValue ?? false;
                  });
                },
                leadingText: AppStrings.agreeWith,
                leadingTextStyle: TextStyle(color: AppColors.black),
                clickableText: AppStrings.termsAndConditions,
                onLinkTap: () {},
              ),
              SizedBox(height: 32),
              ActionButton(
                title: AppStrings.signUpButton,
                onPressed: () => Get.offAllNamed(AppRoutes.signInScreen),
              ),
              SizedBox(height: 110),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCheckbox(
                    leadingText: AppStrings.alreadyHaveAccount,
                    clickableText: AppStrings.signInButton,
                    onLinkTap: () {},
                    clickableTextStyle: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }
}
