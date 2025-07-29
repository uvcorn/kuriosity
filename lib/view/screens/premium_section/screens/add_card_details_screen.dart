import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';
import '../../../components/top_app_bar/top_app_bar.dart';

class AddCardDetailsScreen extends StatefulWidget {
  const AddCardDetailsScreen({super.key});

  @override
  State<AddCardDetailsScreen> createState() => _AddCardDetailsScreenState();
}

class _AddCardDetailsScreenState extends State<AddCardDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();

  String _selectedCountry = 'United Kingdom';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopAppBar(),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      AppStrings.becomeprem,
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  CustomImage(imageSrc: AppIcons.premium),
                ],
              ),
              SizedBox(height: screenHeight * 0.035),
              Text(
                AppStrings.addcardDetails,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.045,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      _buildTextField(
                        controller: _cardNumberController,
                        hintText: AppStrings.cardnumberHint,
                        keyboardType: TextInputType.number,
                        textTheme: textTheme,
                        screenWidth: screenWidth,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              controller: _expiryDateController,
                              hintText: AppStrings.expiryHint,
                              keyboardType: TextInputType.datetime,
                              textTheme: textTheme,
                              screenWidth: screenWidth,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: _buildTextField(
                              controller: _cvvController,
                              hintText: AppStrings.cvvHint,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              textTheme: textTheme,
                              screenWidth: screenWidth,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      _buildTextField(
                        controller: _postcodeController,
                        keyboardType: TextInputType.number,
                        hintText: AppStrings.postalCodeHint,
                        textTheme: textTheme,
                        screenWidth: screenWidth,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      _buildCountryPicker(screenWidth),
                      SizedBox(height: screenHeight * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              AppStrings.backButton,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            onPressed: () {
                              Get.back();
                              // if (_formKey.currentState!.validate()) {}
                              SnackbarHelper.show(
                                message: AppStrings.fromsubmitsnakcbar,
                                isSuccess: true,
                              );
                            },
                            child: Text(
                              AppStrings.done,
                              style: TextStyle(fontSize: screenWidth * 0.045),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    bool obscureText = false,
    required TextTheme textTheme,
    required double screenWidth,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodySmall?.copyWith(fontSize: screenWidth * 0.035),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.035,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      validator: (value) =>
          value == null || value.isEmpty ? AppStrings.requiredField : null,
    );
  }

  Widget _buildCountryPicker(double screenWidth) {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          onSelect: (Country country) {
            setState(() {
              _selectedCountry = country.name;
            });
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.035,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          border: Border.all(color: AppColors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedCountry,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            Icon(Icons.arrow_drop_down, size: screenWidth * 0.06),
          ],
        ),
      ),
    );
  }
}
