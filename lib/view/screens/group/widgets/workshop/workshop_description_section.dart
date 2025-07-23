import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_strings/app_strings.dart';

class WorkshopDescriptionSection extends StatelessWidget {
  const WorkshopDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.workshopdescription,
          style: textTheme.bodyLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        Text(
          AppStrings.workshopdescriptiondetails,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
