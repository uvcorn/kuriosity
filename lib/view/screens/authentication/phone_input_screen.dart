import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../components/action_button/action_button.dart';

class PhoneInputScreen extends StatefulWidget {
  const PhoneInputScreen({super.key});

  @override
  State<PhoneInputScreen> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  CountryCode? _selectedCountryCode; //
  final TextEditingController _mobileTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 106),
              Text(AppStrings.welcomeMessage, style: textTheme.titleLarge),
              SizedBox(height: 28),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      CountryCodePicker(
                        onChanged: (countryCode) {
                          setState(() {
                            _selectedCountryCode = countryCode;
                          });
                        },
                        alignLeft: true,
                        builder: (countryCode) {
                          return Container(
                            height: 56,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                if (_selectedCountryCode != null) ...[
                                  Expanded(
                                    child: Text(
                                      _selectedCountryCode!.name ??
                                          AppStrings.countryOrRegion,
                                      style: textTheme.labelSmall?.copyWith(
                                        color: Colors.black,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ),
                                ] else ...[
                                  Text(
                                    AppStrings.countryOrRegion,
                                    style: textTheme.bodyLarge?.copyWith(
                                      color: AppColors.mediumGray,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                                const Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.mediumGray,
                                ),
                              ],
                            ),
                          );
                        },
                        dialogTextStyle: textTheme.bodyLarge,
                        searchStyle: textTheme.bodyMedium,
                        dialogBackgroundColor: Colors.white,
                        barrierColor: Colors.black.withAlpha(1),
                      ),
                      Divider(
                        height: 0,
                        thickness: 1,
                        color: AppColors.lightGray,
                        indent: 16,
                        endIndent: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: _mobileTEController,
                          decoration: InputDecoration(
                            labelText: AppStrings.phoneNumber,
                            labelStyle: textTheme.labelSmall,
                            border: InputBorder.none,
                            prefixText: _selectedCountryCode != null
                                ? '$_selectedCountryCode'
                                : '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 23),
              Center(
                child: Text(
                  AppStrings.verificationInfo,
                  style: textTheme.bodySmall,
                ),
              ),

              SizedBox(height: 34),
              ActionButton(
                title: AppStrings.continueButton,
                onPressed: () => Get.offAllNamed(AppRoutes.signUpScreen),
              ),
              const SizedBox(height: 59),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.lightGray,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  Text(AppStrings.orSeparator, style: textTheme.bodySmall),
                  const Expanded(
                    child: Divider(
                      color: AppColors.lightGray,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 43),
              ActionButton(
                title: AppStrings.continueWithApple,
                onPressed: () {},
                icon: AppIcons.apple,
                backgroundColor: AppColors.white,
                textColor: Colors.black,
              ),
              SizedBox(height: 12),
              ActionButton(
                title: AppStrings.continueWithFacebook,
                onPressed: () {},
                icon: AppIcons.facebook,
                backgroundColor: AppColors.white,
                textColor: AppColors.black,
              ),
              SizedBox(height: 12),
              ActionButton(
                title: AppStrings.continueWithGoogle,
                onPressed: () {},
                icon: AppIcons.google,
                backgroundColor: AppColors.white,
                textColor: AppColors.black,
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
