// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: PinCodeTextField(
        controller: controller,
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
            return 'Enter your full OTP';
          }
          return null;
        },
      ),
    );
  }
}
