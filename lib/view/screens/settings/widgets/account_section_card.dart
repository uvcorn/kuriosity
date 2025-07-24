import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_image/custom_image.dart';
import '../models/account_item.dart';

class AccountSectionCard extends StatelessWidget {
  final List<AccountItem> menuItems;
  final String title;
  const AccountSectionCard({
    super.key,
    required this.menuItems,
    required this.title,
  });

  static const double _rowHeight = 24.0;
  static const double _dividerTotalHeight = 16.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.02; // 4% of screen width

    double calculatedHeight = 0;
    if (menuItems.isNotEmpty) {
      calculatedHeight += menuItems.length * _rowHeight;

      if (menuItems.length > 1) {
        calculatedHeight += (menuItems.length - 1) * _dividerTotalHeight;
      }

      calculatedHeight += (2 * 12.0);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            title,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Container(
            height: calculatedHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(menuItems.length * 2 - 1, (index) {
                  if (index.isEven) {
                    final itemIndex = index ~/ 2;
                    final item = menuItems[itemIndex];
                    return _buildBarRow(
                      textTheme,
                      item.title,
                      item.iconPath,
                      item.onTap,
                    );
                  } else {
                    return const Divider(color: AppColors.lightGray);
                  }
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBarRow(
    TextTheme textTheme,
    String title,
    String image,
    VoidCallback? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CustomImage(imageSrc: image),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.keyboard_arrow_right, size: 24),
        ],
      ),
    );
  }
}
