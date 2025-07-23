import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';

class WhoShouldAttendSection extends StatelessWidget {
  const WhoShouldAttendSection({super.key});

  Widget _buildNumberedText(TextTheme textTheme, String number, String text) {
    return Row(
      children: [
        Text(
          number,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.primary,
            fontSize: 18,
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.whotitle,
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        _buildNumberedText(textTheme, '01', AppStrings.whotitle1),
        const SizedBox(height: 10),
        _buildNumberedText(textTheme, '02', AppStrings.whotitle2),
        const SizedBox(height: 10),
        _buildNumberedText(textTheme, '03', AppStrings.whotitle3),
      ],
    );
  }
}
