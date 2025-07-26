import 'package:flutter/material.dart';

class CardBar extends StatelessWidget {
  final TextTheme textTheme;
  final String title;
  final String? subtitle;
  final VoidCallback? vieallTap;
  const CardBar({
    super.key,
    required this.textTheme,
    required this.title,
    this.subtitle,
    this.vieallTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),
        ),
        if (subtitle != null && subtitle!.isNotEmpty)
          GestureDetector(
            onTap: vieallTap,
            child: Text(subtitle!, style: textTheme.bodySmall),
          ),
      ],
    );
  }
}
