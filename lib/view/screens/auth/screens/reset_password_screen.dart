import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/action_button/action_button.dart';
import '../../../components/custom_text_field/custom_text_field.dart';
import '../../../components/input_card_container/input_card_container.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller = Get.put(
      ResetPasswordController(),
    );

    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.1),
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
                      Obx(
                        () => CustomTextField(
                          controller: controller.passwordTEController,
                          labelText: AppStrings.newPassword,
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
                          labelText: AppStrings.confirmNewPassword,
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
                  SizedBox(height: size.height * 0.4),
                  ActionButton(
                    title: AppStrings.resetPassword,
                    onPressed: controller.resetPassword,
                  ),
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
