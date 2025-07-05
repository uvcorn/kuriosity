import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/app/app_theme.dart';
import 'package:kuriosity/features/auth/ui/screens/sign_in_screen.dart';
import 'package:kuriosity/features/auth/ui/widgets/custom_checkbox_with_richtext.dart';
import 'package:kuriosity/features/auth/ui/widgets/custom_textfield.dart';
import 'package:kuriosity/features/auth/ui/widgets/input_card_container.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPassTEController =
      TextEditingController();
  bool _isPasswordObscure = true;
  bool _agreedToTerms = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 80),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome here!', style: textTheme.titleLarge),
                Text('Create an account.', style: textTheme.titleLarge),
                Text('Fill in your information.', style: textTheme.bodyLarge),
              ],
            ),
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
                  child: InputCardContainer(
                    children: [
                      CustomTextField(
                        controller: _firstNameTEController,
                        labelText: 'First Name',
                      ),
                      CustomTextField(
                        controller: _lastNameTEController,
                        labelText: 'Last Name',
                      ),
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
                      CustomTextField(
                        controller: _confirmPassTEController,
                        labelText: 'Confirm Password',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _isPasswordObscure,
                        enableValidation: true,
                        confirmPasswordController: _confirmPassTEController,
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
              value: _agreedToTerms,
              onChanged: (newValue) {
                setState(() {
                  _agreedToTerms = newValue ?? false;
                });
              },
              leadingText: 'Agree with ',
              leadingTextStyle: TextStyle(color: Colors.black),
              clickableText: 'Terms and Conditions.',
              onLinkTap: () {},
            ),
            SizedBox(height: 30),
            ActionButton(
              title: 'Sign Up',
              onPressed: () => Get.off(SignInScreen()),
            ),
            SizedBox(height: 70),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCheckboxWithRichText(
                  leadingText: 'Already have an acount',
                  clickableText: ' Sign In',
                  onLinkTap: () {},
                  clickableTextStyle: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
