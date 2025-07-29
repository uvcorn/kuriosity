import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/bottom_nav_bar/bottom_nav_bar.dart';
import '../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';
import '../../../components/top_app_bar/top_app_bar.dart';

class PriceAndPaymentMethodScreen extends StatelessWidget {
  const PriceAndPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            children: [
              TopAppBar(),
              SizedBox(height: screenHeight * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    AppStrings.paymentprice,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppStrings.individualmembership,
                          style: textTheme.bodyMedium?.copyWith(),
                        ),
                      ),
                      Text(
                        AppStrings.price,
                        style: textTheme.bodyMedium?.copyWith(),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Payment method
                  Text(
                    AppStrings.paymentmethod,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      child: CustomImage(
                        imageSrc: AppImages.carditcard,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    ),
                    child: Row(
                      children: [
                        CustomImage(
                          imageSrc: AppIcons.masterCard,
                          size: screenWidth * 0.05,
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: Text(
                            AppStrings.cardno,
                            style: textTheme.bodyMedium?.copyWith(),
                          ),
                        ),
                        const Icon(Icons.radio_button_checked),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  // Add card
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenHeight * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.addCardDetailsScreen);
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppStrings.addcardDetails,
                                style: textTheme.bodyMedium?.copyWith(),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: screenWidth * 0.035,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        final BottomNavController navcontroller =
                            Get.find<BottomNavController>();
                        navcontroller.changeIndex(0);
                        Get.offAll(() => const BottomNavBar());

                        // if (_formKey.currentState!.validate()) {}
                        SnackbarHelper.show(
                          message: AppStrings.paymentReciveSnackbar,
                          isSuccess: true,
                        );
                      },
                      child: Text(
                        AppStrings.confirmandpay,
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
