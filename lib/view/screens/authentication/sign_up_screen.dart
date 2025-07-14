import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.06),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(AppStrings.welcomeHere, style: textTheme.titleLarge),
                    Text(AppStrings.createAccount, style: textTheme.titleLarge),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      AppStrings.fillInformation,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),

                // Input Form Container
                InputCardContainer(
                  minHeight: 290,
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
                      labelText: AppStrings.email,
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

                SizedBox(height: size.height * 0.02),

                // Terms Checkbox
                CustomCheckbox(
                  showCheckbox: true,
                  value: _agreedToTerms,
                  onChanged: (newValue) {
                    setState(() {
                      _agreedToTerms = newValue ?? false;
                    });
                  },
                  leadingText: AppStrings.agreeWith,
                  leadingTextStyle: textTheme.bodySmall?.copyWith(
                    color: AppColors.black,
                  ),
                  clickableText: AppStrings.termsAndConditions,
                  onLinkTap: () {},
                ),

                SizedBox(height: size.height * 0.04),

                // Sign Up Button
                ActionButton(
                  title: AppStrings.signUpButton,
                  onPressed: () => Get.offAllNamed(AppRoutes.signInScreen),
                ),

                SizedBox(height: size.height * 0.25),

                // Already Have Account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCheckbox(
                      showCheckbox: false,
                      leadingText: AppStrings.alreadyHaveAccount,
                      clickableText: AppStrings.signInButton,
                      onLinkTap: () => Get.toNamed(AppRoutes.signInScreen),
                      clickableTextStyle: textTheme.bodySmall?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
