import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/action_button/action_button.dart';
import '../controllers/phone_input_controller.dart';

class PhoneInputScreen extends StatelessWidget {
  const PhoneInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PhoneInputController controller = Get.put(PhoneInputController());

    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.1),
                Text(AppStrings.welcomeMessage, style: textTheme.titleLarge),
                SizedBox(height: size.height * 0.03),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Obx(() {
                        final country = controller.selectedCountry.value;
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          title: Text(
                            country != null
                                ? '${country.flagEmoji}  ${country.name} (+${country.phoneCode})'
                                : AppStrings.countryOrRegion,
                            style: textTheme.bodyMedium,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.mediumGray,
                          ),
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              favorite: ['US', 'BD'], // optional
                              countryListTheme: CountryListThemeData(
                                flagSize: 24,
                                backgroundColor: Colors.white,
                                textStyle: textTheme.bodyLarge,
                                inputDecoration: InputDecoration(
                                  labelText: 'Search country',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              ),
                              onSelect: (Country c) {
                                controller.onCountryChanged(c);
                              },
                            );
                          },
                        );
                      }),

                      const Divider(
                        color: AppColors.lightGray,
                        indent: 16,
                        endIndent: 16,
                      ),

                      // Phone input field
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: controller.mobileTEController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: AppStrings.phoneNumber,
                            labelStyle: textTheme.labelSmall,
                            border: InputBorder.none,
                            prefixText: controller.selectedCountry.value != null
                                ? '+${controller.selectedCountry.value!.phoneCode} '
                                : '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.03),
                Text(
                  AppStrings.verificationInfo,
                  style: textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: size.height * 0.04),
                ActionButton(
                  title: AppStrings.continueButton,
                  onPressed: controller.continueToSignUp,
                ),

                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.lightGray,
                        thickness: 1,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        AppStrings.orSeparator,
                        style: textTheme.bodySmall,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColors.lightGray,
                        thickness: 1,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),

                // Social Buttons
                ActionButton(
                  title: AppStrings.continueWithApple,
                  onPressed: controller.continueWithApple,
                  icon: AppIcons.apple,
                  backgroundColor: AppColors.white,
                  textColor: Colors.black,
                ),
                SizedBox(height: size.height * 0.015),
                ActionButton(
                  title: AppStrings.continueWithFacebook,
                  onPressed: controller.continueWithFacebook,
                  icon: AppIcons.facebook,
                  backgroundColor: AppColors.white,
                  textColor: AppColors.black,
                ),
                SizedBox(height: size.height * 0.015),
                ActionButton(
                  title: AppStrings.continueWithGoogle,
                  onPressed: controller.continueWithGoogle,
                  icon: AppIcons.google,
                  backgroundColor: AppColors.white,
                  textColor: AppColors.black,
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
