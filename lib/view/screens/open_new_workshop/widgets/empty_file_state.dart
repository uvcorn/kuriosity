import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';

class EmptyFileState extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String message;
  final double spacing;
  final TextStyle? messageStyle;
  final MainAxisAlignment alignment;

  const EmptyFileState({
    super.key,
    required this.icon,
    required this.message,
    this.iconSize = 80,
    this.spacing = 8,
    this.messageStyle,
    this.alignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: alignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize),
          SizedBox(height: spacing),
          Text(
            message,
            textAlign: TextAlign.center,
            style:
                messageStyle ??
                Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
