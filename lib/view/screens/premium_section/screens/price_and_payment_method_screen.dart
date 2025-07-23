import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class PriceAndPaymentMethodScreen extends StatelessWidget {
  const PriceAndPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    AppStrings.paymentprice,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        AppStrings.individualmembership,
                        style: textTheme.bodyMedium,
                      ),
                      Spacer(),
                      Text(AppStrings.price, style: textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: 24),

                  // Payment method
                  Text(
                    AppStrings.paymentmethod,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ClipRRect(
                      child: CustomImage(
                        imageSrc: AppImages.carditcard,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        CustomImage(imageSrc: AppIcons.masterCard, size: 20),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            AppStrings.cardno,
                            style: textTheme.bodyMedium,
                          ),
                        ),
                        Icon(Icons.radio_button_checked),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Add card
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.addCardDetailsScreen);
                        },
                        child: Row(
                          children: [
                            Text(
                              AppStrings.addcardDetails,
                              style: textTheme.bodyMedium,
                            ),

                            Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 80),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        // if (_formKey.currentState!.validate()) {}
                        SnackbarHelper.show(
                          message: AppStrings.paymentReciveSnackbar,
                        );
                      },
                      child: Text(
                        AppStrings.confirmandpay,
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
