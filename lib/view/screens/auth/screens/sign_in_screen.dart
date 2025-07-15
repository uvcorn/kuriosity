import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/action_button/action_button.dart';
import '../../../components/custom_checkbox/custom_checkbox.dart';
import '../../../components/custom_text_field/custom_text_field.dart';
import '../../../components/input_card_container/input_card_container.dart';
import '../controllers/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.put(SignInController());

    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.08),
                Text(AppStrings.welcomeMessage, style: textTheme.titleLarge),
                SizedBox(height: size.height * 0.03),

                InputCardContainer(
                  minHeight: 116,
                  children: [
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
                  ],
                ),

                SizedBox(height: size.height * 0.015),

                Obx(
                  () => CustomCheckbox(
                    showCheckbox: true,
                    value: controller.rememberTerms.value,
                    onChanged: controller.toggleRememberMe,
                    leadingText: AppStrings.rememberMe,
                    leadingTextStyle: textTheme.bodySmall?.copyWith(
                      color: AppColors.black,
                    ),
                    clickableText: AppStrings.forgotPassword,
                    clickableTextStyle: textTheme.bodyMedium,
                    useSpaceBetweenAlignment: true,
                    onLinkTap: controller.goToForgotPassword,
                  ),
                ),

                SizedBox(height: size.height * 0.06),

                ActionButton(
                  title: AppStrings.continueButton,
                  onPressed: controller.signIn,
                ),

                SizedBox(height: size.height * 0.06),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.lightBorder,
                        thickness: 1,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        AppStrings.orSeparator,
                        style: textTheme.bodySmall,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColors.lightBorder,
                        thickness: 1,
                        height: 1,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.04),

                ActionButton(
                  title: AppStrings.continueWithApple,
                  onPressed: controller.continueWithApple,
                  icon: AppIcons.apple,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 12),
                ActionButton(
                  title: AppStrings.continueWithFacebook,
                  onPressed: controller.continueWithFacebook,
                  icon: AppIcons.facebook,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 12),
                ActionButton(
                  title: AppStrings.continueWithGoogle,
                  onPressed: controller.continueWithGoogle,
                  icon: AppIcons.google,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
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
