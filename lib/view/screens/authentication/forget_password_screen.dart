import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/action_button/action_button.dart';
import '../../components/custom_text_field/custom_text_field.dart';
import '../../components/input_card_container/input_card_container.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 106),
              Text(
                AppStrings.forgotPasswordHeader,
                style: textTheme.titleLarge,
              ),
              SizedBox(height: 26),
              Text(
                AppStrings.forgotPasswordDescription,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 40),
              InputCardContainer(
                children: [
                  CustomTextField(
                    controller: _emailTEController,
                    labelText: AppStrings.email,
                  ),
                ],
              ),
              SizedBox(height: 360),
              ActionButton(
                title: AppStrings.getVerificationCode,
                onPressed: () => Get.offAllNamed(AppRoutes.otpVerifyScreen),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
