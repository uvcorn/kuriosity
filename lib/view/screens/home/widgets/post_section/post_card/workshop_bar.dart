import 'package:flutter/material.dart';
import '../../../../../../utils/app_colors/app_colors.dart';

class WorkshopBar extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const WorkshopBar({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.lightBlueBackground,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Joining "$title"',
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.black, size: 16),
          ],
        ),
      ),
    );
  }
}
