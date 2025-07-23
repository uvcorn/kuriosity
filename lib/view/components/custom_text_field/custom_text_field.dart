import 'package:flutter/material.dart';

import '../../../utils/app_strings/app_strings.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final VoidCallback? onToggleObscureText;
  final bool enableValidation; // For password validation
  final TextEditingController?
  confirmPasswordController; // For confirm password

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.onToggleObscureText,
    this.enableValidation = false,
    this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: enableValidation ? _passwordValidator : null,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: textTheme.labelSmall,
          border: InputBorder.none,
          suffixIcon: onToggleObscureText != null
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: onToggleObscureText,
                )
              : null,
        ),
      ),
    );
  }

  /// Password Validator (6-8 chars) & Confirm Password Validator
  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    } else if (value.length < 6 || value.length > 8) {
      return AppStrings.passwordLength;
    }

    if (confirmPasswordController != null) {
      if (value != confirmPasswordController!.text) {
        return AppStrings.passwordMismatch;
      }
    }

    return null;
  }
}
