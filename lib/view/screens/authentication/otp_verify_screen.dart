import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
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
  // void dispose() {
  //   _otpTEController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 106),
              Text(
                AppStrings.enterVerificationCode,
                style: textTheme.titleLarge,
              ),
              SizedBox(height: 16),
              Text(
                AppStrings.enterVerificationCode,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              CustomPinCode(controller: _otpTEController),
              SizedBox(height: 37),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CustomCheckbox(
                      showCheckbox: false,
                      leadingText: AppStrings.noCodeReceived,
                      leadingTextStyle: TextStyle(color: Colors.black),
                      clickableText: AppStrings.resendCode,
                      centerAlignment: true,
                      clickableTextStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      useSpaceBetweenAlignment: false,
                      onLinkTap: () {},
                    ),
                  ),
                  SizedBox(height: 41),
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
    );
  }
}
