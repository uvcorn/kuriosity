import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';

class TermsAndPolicyScreen extends StatelessWidget {
  const TermsAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.04),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: Text(
                    AppStrings.termandPolicy,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.privacyPolicyScreen);
                  },
                  child: Row(
                    children: [
                      SizedBox(width: width * 0.02),
                      CustomImage(imageSrc: AppIcons.prootection),
                      SizedBox(width: width * 0.04),
                      Expanded(
                        child: Text(
                          AppStrings.privacyPolicy,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.025),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.termsAndConditionScreen);
                  },
                  child: Row(
                    children: [
                      SizedBox(width: width * 0.02),
                      CustomImage(imageSrc: AppIcons.document),
                      SizedBox(width: width * 0.04),
                      Expanded(
                        child: Text(
                          AppStrings.termsAndConditions2,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
