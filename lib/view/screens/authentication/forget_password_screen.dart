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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height - MediaQuery.of(context).padding.top,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.08),

                    // Title
                    Text(
                      AppStrings.forgotPasswordHeader,
                      style: textTheme.titleLarge,
                    ),

                    SizedBox(height: size.height * 0.025),

                    // Description
                    Text(
                      AppStrings.forgotPasswordDescription,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                      ),
                    ),

                    SizedBox(height: size.height * 0.05),

                    // Email Input
                    InputCardContainer(
                      minHeight: 58,
                      children: [
                        CustomTextField(
                          controller: _emailTEController,
                          labelText: AppStrings.email,
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Continue Button
                    ActionButton(
                      title: AppStrings.getVerificationCode,
                      onPressed: () =>
                          Get.offAllNamed(AppRoutes.otpVerifyScreen),
                    ),

                    SizedBox(height: size.height * 0.1),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
