import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/action_button/action_button.dart';
import '../../../components/custom_checkbox/custom_checkbox.dart';
import '../../../components/custom_text_field/custom_text_field.dart';
import '../../../components/input_card_container/input_card_container.dart';
import '../controllers/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final SignUpController controller = Get.put(SignUpController());

  @override
  void dispose() {
    Get.delete<SignUpController>();
    super.dispose();
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.06),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(AppStrings.welcomeHere, style: textTheme.titleLarge),
                      Text(
                        AppStrings.createAccount,
                        style: textTheme.titleLarge,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        AppStrings.fillInformation,
                        style: textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.04),

                  InputCardContainer(
                    minHeight: 290,
                    children: [
                      CustomTextField(
                        controller: controller.firstNameTEController,
                        labelText: AppStrings.firstName,
                      ),
                      CustomTextField(
                        controller: controller.lastNameTEController,
                        labelText: AppStrings.lastName,
                      ),
                      CustomTextField(
                        controller: controller.emailTEController,
                        labelText: AppStrings.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Obx(
                        () => CustomTextField(
                          controller: controller.passwordTEController,
                          labelText: AppStrings.password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isPasswordObscure.value,
                          enableValidation: true,
                          onToggleObscureText:
                              controller.togglePasswordVisibility,
                        ),
                      ),
                      Obx(
                        () => CustomTextField(
                          controller: controller.confirmPassTEController,
                          labelText: AppStrings.confirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          confirmPasswordController:
                              controller.passwordTEController,
                          obscureText: controller.isPasswordObscure.value,
                          enableValidation: true,
                          onToggleObscureText:
                              controller.togglePasswordVisibility,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.02),

                  Obx(
                    () => CustomCheckbox(
                      showCheckbox: true,
                      value: controller.agreedToTerms.value,
                      onChanged: controller.toggleAgreedToTerms,
                      leadingText: AppStrings.agreeWith,
                      leadingTextStyle: textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                      ),
                      clickableText: AppStrings.termsAndConditions,
                      onLinkTap: () {},
                    ),
                  ),

                  SizedBox(height: size.height * 0.04),

                  ActionButton(
                    title: AppStrings.signUpButton,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        controller.signUp();
                      }
                    },
                  ),

                  SizedBox(height: size.height * 0.08),

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
      ),
    );
  }
}
