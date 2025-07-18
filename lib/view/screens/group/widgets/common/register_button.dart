import 'package:flutter/material.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';

class RegisterButton extends StatelessWidget {
  final bool isFinished;
  final int spacesLeft;
  final String workshopTitle;
  final double buttonwidth;
  final double buttonhight;
  final VoidCallback? onPressed;

  const RegisterButton({
    super.key,
    required this.isFinished,
    required this.spacesLeft,
    required this.workshopTitle,
    required this.buttonwidth,
    required this.buttonhight,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    bool canPress = !isFinished && spacesLeft > 0;

    return SizedBox(
      width: double.infinity,
      height: buttonhight,
      child: ElevatedButton(
        onPressed: canPress ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          isFinished
              ? AppStrings.workshopfinished
              : spacesLeft == 0
              ? AppStrings.full
              : AppStrings.register,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
