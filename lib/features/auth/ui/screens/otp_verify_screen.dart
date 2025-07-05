import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/features/auth/ui/screens/reset_password_screen.dart';
import 'package:kuriosity/features/auth/ui/screens/sign_in_screen.dart';
import 'package:kuriosity/features/auth/ui/widgets/custom_checkbox_with_richtext.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  // void dispose() {
  //   _otpTEController.dispose(); // Controller dispose করা উচিত
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
              Text('Forget your Password', style: textTheme.titleLarge),
              SizedBox(height: 16),
              Text(
                'Enter your email address to reset your password.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              PinCodeTextField(
                controller: _otpTEController,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  activeColor: Colors.grey.shade200,
                  inactiveColor: Colors.grey.shade200,
                  selectedColor: Colors.grey.shade200,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  fieldWidth: 70,
                  fieldHeight: 58,
                ),
                appContext: context,
                validator: (String? value) {
                  if (value == null || value.length < 4) {
                    return 'Enter your OTP';
                  }
                  return null;
                },
              ),
              SizedBox(height: 37),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CustomCheckboxWithRichText(
                      showCheckbox: false,
                      leadingText: 'Didn’t receive the code?',
                      leadingTextStyle: TextStyle(color: Colors.black),
                      clickableText: 'Resend',
                      centerAlignment: true,
                      clickableTextStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      useSpaceBetweenAlignment: false,
                      onLinkTap: () => Get.off(SignInScreen()),
                    ),
                  ),
                  SizedBox(height: 41),
                  ActionButton(
                    title: 'Verify',
                    onPressed: () => Get.off(ResetPasswordScreen()),
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
