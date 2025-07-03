import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome here!', style: textTheme.titleLarge),
                Text('Create an account.', style: textTheme.titleLarge),
                Text('Fill in your information.', style: textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
