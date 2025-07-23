import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';

class MaterialSection extends StatelessWidget {
  const MaterialSection({super.key});

  Widget _buildNumberedText(TextTheme textTheme, String number, String text) {
    return Row(
      children: [
        Text(
          number,
          style: textTheme.bodyMedium?.copyWith(color: AppColors.primary),
        ),
        SizedBox(width: Get.width * 0.02),
        Expanded(child: Text(text, style: textTheme.bodyMedium)),

        IconButton(onPressed: () {}, icon: Icon(Icons.download_sharp)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Material',
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          _buildNumberedText(textTheme, '01', AppStrings.materialtitle),
          const SizedBox(height: 10),
          _buildNumberedText(textTheme, '02', AppStrings.materialtitle),
        ],
      ),
    );
  }
}
