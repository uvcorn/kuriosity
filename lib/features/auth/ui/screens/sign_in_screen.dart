import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/features/auth/ui/screens/forget_password.dart';
import 'package:kuriosity/features/auth/ui/widgets/custom_checkbox_with_richtext.dart';
import 'package:kuriosity/features/auth/ui/widgets/custom_textfield.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text('Welcome to \nWild Curiosity', style: textTheme.titleLarge),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailTEController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Divider(
                        height: 0,
                        thickness: 1,
                        color: Colors.grey[300],
                        indent: 5,
                        endIndent: 5,
                      ),
                      CustomTextField(
                        controller: _passwordTEController,
                        labelText: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _isPasswordObscure,
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
            ),
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
            SizedBox(height: 30),
            ActionButton(
              title: 'Continue',
              onPressed: () => Get.off(SignInScreen()),
            ),
            const SizedBox(height: 32),
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
              iconOnLeft: true,
              icon: Icons.apple,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: 12),
            ActionButton(
              title: 'Continue with Facebook',
              onPressed: () {},
              iconOnLeft: true,
              icon: Icons.facebook,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: 12),
            ActionButton(
              title: 'Continue with Google',
              onPressed: () {},
              iconOnLeft: true,
              icon: Icons.g_mobiledata,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
