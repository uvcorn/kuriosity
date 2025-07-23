import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class AddCardDetailsScreen extends StatefulWidget {
  const AddCardDetailsScreen({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    AppStrings.becomeprem,
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  CustomImage(imageSrc: AppIcons.premium),
                ],
              ),
              SizedBox(height: 30),

              Text(
                AppStrings.addcardDetails,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      _buildTextField(
                        controller: _cardNumberController,
                        hintText: AppStrings.cardnumberHint,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              controller: _expiryDateController,
                              hintText: AppStrings.expiryHint,
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTextField(
                              controller: _cvvController,
                              hintText: AppStrings.cvvHint,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _postcodeController,
                        keyboardType: TextInputType.number,
                        hintText: AppStrings.postalCodeHint,
                      ),
                      const SizedBox(height: 16),
                      _buildCountryPicker(),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text(
                              AppStrings.backButton,
                              style: TextStyle(color: AppColors.primary),
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
                              );
                            },
                            child: const Text(AppStrings.done),
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
  }) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodySmall,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      validator: (value) =>
          value == null || value.isEmpty ? AppStrings.requiredField : null,
    );
  }

  Widget _buildCountryPicker() {
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_selectedCountry, style: const TextStyle(fontSize: 16)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
