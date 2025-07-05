import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/features/auth/ui/screens/sign_up_screen.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';
import 'package:kuriosity/utils/app_icons/app_icons.dart';

class CountryAndPhoneNumberInputScreen extends StatefulWidget {
  const CountryAndPhoneNumberInputScreen({super.key});

  @override
  State<CountryAndPhoneNumberInputScreen> createState() =>
      _CountryAndPhoneNumberInputScreenState();
}

class _CountryAndPhoneNumberInputScreenState
    extends State<CountryAndPhoneNumberInputScreen> {
  CountryCode? _selectedCountryCode; //
  final TextEditingController _mobileTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 106),
            Text('Welcome to \nWild Curiosity', style: textTheme.titleLarge),
            SizedBox(height: 28),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                                        'Country/Region',
                                    style: textTheme.bodyLarge?.copyWith(
                                      color: Colors.black87,
                                      overflow: TextOverflow.fade,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ] else ...[
                                Text(
                                  'Country/Region',
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                              const Spacer(),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey[700],
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
                      color: Colors.grey[300],
                      indent: 16,
                      endIndent: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _mobileTEController,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(fontSize: 12),
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
                'We’ll call or text you to confirm your number. \nStandard message and data rates apply.',
                style: textTheme.bodySmall,
              ),
            ),

            SizedBox(height: 34),
            ActionButton(
              title: 'Continue',
              onPressed: () => Get.off(SignUpScreen()),
            ),
            const SizedBox(height: 59),
            Row(
              children: [
                const Expanded(
                  child: Divider(color: Colors.grey, thickness: 1, height: 1),
                ),
                Text('or', style: textTheme.bodySmall),
                const Expanded(
                  child: Divider(color: Colors.grey, thickness: 1, height: 1),
                ),
              ],
            ),
            const SizedBox(height: 43),
            ActionButton(
              title: 'Continue with Apple',
              onPressed: () {},
              icon: AppIcons.apple,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: 12),
            ActionButton(
              title: 'Continue with Facebook',
              onPressed: () {},
              icon: AppIcons.facebook,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: 12),
            ActionButton(
              title: 'Continue with Google',
              onPressed: () {},
              icon: AppIcons.google,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
