import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/action_button/action_button.dart';
import '../../components/custom_checkbox/custom_checkbox.dart';
import '../../components/custom_text_field/custom_text_field.dart';
import '../../components/input_card_container/input_card_container.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  bool _isPasswordObscure = true;
  bool _rememberTerms = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 106),
              Text(AppStrings.welcomeMessage, style: textTheme.titleLarge),
              SizedBox(height: 28),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InputCardContainer(
                    children: [
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              CustomCheckbox(
                showCheckbox: true,
                value: _rememberTerms,
                onChanged: (newValue) {
                  setState(() {
                    _rememberTerms = newValue ?? false;
                  });
                },
                leadingText: AppStrings.rememberMe,
                leadingTextStyle: textTheme.bodySmall!.copyWith(
                  color: AppColors.black,
                ),
                clickableText: AppStrings.forgotPassword,
                clickableTextStyle: textTheme.bodyMedium,
                useSpaceBetweenAlignment: true,
                onLinkTap: () =>
                    Get.offAllNamed(AppRoutes.forgotPasswordScreen),
              ),
              SizedBox(height: 50),
              ActionButton(title: AppStrings.continueButton, onPressed: () {}),
              const SizedBox(height: 50),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.lightBorder,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  Text(AppStrings.orSeparator, style: textTheme.bodySmall),
                  const Expanded(
                    child: Divider(
                      color: AppColors.lightBorder,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ActionButton(
                title: AppStrings.continueWithApple,
                onPressed: () {},
                icon: AppIcons.apple,
                backgroundColor: Colors.white,
                textColor: Colors.black,
              ),
              SizedBox(height: 12),
              ActionButton(
                title: AppStrings.continueWithFacebook,
                onPressed: () {},
                icon: AppIcons.facebook,
                backgroundColor: Colors.white,
                textColor: Colors.black,
              ),
              SizedBox(height: 12),
              ActionButton(
                title: AppStrings.continueWithGoogle,
                onPressed: () {},
                icon: AppIcons.google,
                backgroundColor: Colors.white,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
