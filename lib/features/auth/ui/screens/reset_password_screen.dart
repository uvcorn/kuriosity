import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/features/auth/ui/screens/sign_in_screen.dart';
import 'package:kuriosity/features/auth/ui/widgets/custom_textfield.dart';
import 'package:kuriosity/features/auth/ui/widgets/input_card_container.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPassTEController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 106),
              Text('Now reset your password.', style: textTheme.titleMedium),
              SizedBox(height: 10),
              Text(
                'Password  must have 6-8 characters.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 30),
              InputCardContainer(
                children: [
                  CustomTextField(
                    controller: _passwordTEController,
                    labelText: 'New Password',
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
                    labelText: 'Confirm New Password',
                    keyboardType: TextInputType.visiblePassword,
                    confirmPasswordController: _confirmPassTEController,
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

              SizedBox(height: 334),
              ActionButton(
                title: 'Reset Password',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.off(SignInScreen());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
