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
    this.iconSize = 30,
    this.spacing = 6,
    this.messageStyle,
    this.alignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: alignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: AppColors.gray),
          SizedBox(height: spacing),
          Text(
            message,
            textAlign: TextAlign.center,
            style: messageStyle ?? textTheme.labelSmall?.copyWith(),
          ),
        ],
      ),
    );
  }
}
