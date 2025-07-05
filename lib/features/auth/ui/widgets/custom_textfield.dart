import 'package:flutter/material.dart';

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
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: enableValidation ? _passwordValidator : null,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 12),
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
    );
  }

  /// Password Validator (6-8 chars) & Confirm Password Validator
  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6 || value.length > 8) {
      return 'Password must be 6-8 characters';
    }

    if (confirmPasswordController != null) {
      if (value != confirmPasswordController!.text) {
        return 'Passwords do not match';
      }
    }

    return null;
  }
}
