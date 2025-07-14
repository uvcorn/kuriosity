import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/action_button/action_button.dart';
import '../../components/custom_checkbox/custom_checkbox.dart';
import '../../components/custom_pin_code/custom_pin_code.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.08),
                    Text(
                      AppStrings.enterVerificationCode,
                      style: textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      AppStrings.enterVerificationCode,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.02),
                    CustomPinCode(controller: _otpTEController),
                    SizedBox(height: size.height * 0.045),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomCheckbox(
                          showCheckbox: false,
                          leadingText: AppStrings.noCodeReceived,
                          leadingTextStyle: textTheme.bodySmall?.copyWith(
                            color: AppColors.black,
                          ),
                          clickableText: AppStrings.resendCode,
                          centerAlignment: true,
                          clickableTextStyle: textTheme.bodyMedium,
                          useSpaceBetweenAlignment: false,
                          onLinkTap: () {},
                        ),
                        SizedBox(height: size.height * 0.06),
                        ActionButton(
                          title: AppStrings.verifyButton,
                          onPressed: () =>
                              Get.offAllNamed(AppRoutes.resetPasswordScreen),
                        ),
                      ],
                    ),
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
