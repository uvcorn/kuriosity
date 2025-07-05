import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/features/auth/ui/screens/forget_password.dart';
import 'package:kuriosity/features/auth/ui/widgets/custom_checkbox_with_richtext.dart';
import 'package:kuriosity/features/auth/ui/widgets/custom_textfield.dart';
import 'package:kuriosity/features/auth/ui/widgets/input_card_container.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';
import 'package:kuriosity/utils/app_icons/app_icons.dart';

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
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 106),
            Text('Welcome to \nWild Curiosity', style: textTheme.titleLarge),
            SizedBox(height: 28),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InputCardContainer(
                  children: [
                    CustomTextField(
                      controller: _emailTEController,
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: _passwordTEController,
                      labelText: 'Password',
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
            CustomCheckboxWithRichText(
              showCheckbox: true,
              value: _rememberTerms,
              onChanged: (newValue) {
                setState(() {
                  _rememberTerms = newValue ?? false;
                });
              },
              leadingText: 'Remember me',
              leadingTextStyle: TextStyle(color: Colors.black),
              clickableText: 'Forgot Password',
              clickableTextStyle: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              useSpaceBetweenAlignment: true,
              onLinkTap: () => Get.off(ForgetPassword()),
            ),
            SizedBox(height: 62),
            ActionButton(title: 'Continue', onPressed: () {}),
            const SizedBox(height: 60),
            Row(
              children: [
                const Expanded(
                  child: Divider(color: Colors.grey, thickness: 1, height: 1),
                ),
                Text('or', style: textTheme.bodySmall),
                const Expanded(
                  child: Divider(color: Colors.grey, thickness: 1, height: 1),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ActionButton(
              title: 'Continue with Apple',
              onPressed: () {},
              icon: AppIcons.apple,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: 12),
            ActionButton(
              title: 'Continue with Facebook',
              onPressed: () {},
              icon: AppIcons.facebook,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: 12),
            ActionButton(
              title: 'Continue with Google',
              onPressed: () {},
              icon: AppIcons.google,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
