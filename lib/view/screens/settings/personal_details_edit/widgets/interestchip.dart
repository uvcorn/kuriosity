import 'package:flutter/material.dart';

import '../../../../../utils/app_colors/app_colors.dart';

class Interestchip extends StatelessWidget {
  final String interest;
  const Interestchip({super.key, required this.interest});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.lightBlueBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        interest,
        style: textTheme.labelSmall?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
