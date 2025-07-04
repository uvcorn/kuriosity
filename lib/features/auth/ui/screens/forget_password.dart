import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/features/auth/ui/screens/otp_verify_screen.dart';
import 'package:kuriosity/features/auth/ui/widgets/custom_textfield.dart';
import 'package:kuriosity/features/auth/ui/widgets/input_card_container.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 90),
            Text('Forget your Password', style: textTheme.titleLarge),
            SizedBox(height: 16),
            Text(
              'Enter your email address to reset your password.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            InputCardContainer(
              children: [
                CustomTextField(
                  controller: _emailTEController,
                  labelText: 'Email',
                ),
              ],
            ),
            Spacer(),
            ActionButton(
              title: 'Get Verification Code',
              onPressed: () => Get.off(OtpVerifyScreen()),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
