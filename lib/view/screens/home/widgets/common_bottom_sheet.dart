// common_bottom_sheet.dart
import 'package:flutter/material.dart';
// Assuming this path is correct for AppColors
import '../../../../utils/app_colors/app_colors.dart';

typedef ScrollableWidgetBuilder =
    Widget Function(BuildContext context, ScrollController scrollController);

class CommonBottomSheet extends StatelessWidget {
  final ScrollableWidgetBuilder contentBuilder;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final String? title;
  final bool showDivider;

  const CommonBottomSheet({
    super.key,
    required this.contentBuilder,
    required this.initialChildSize,
    required this.minChildSize,
    required this.maxChildSize,
    this.title,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundLightGray,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 8),
                          child: Container(
                            width: 32,
                            height: 3,
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        if (title != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                title!,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (showDivider)
                    Divider(
                      height: 0,
                      thickness: 1,
                      color: AppColors.lightGray,
                      indent: 16,
                      endIndent: 16,
                    ),
                  if (title != null || showDivider) const SizedBox(height: 8),

                  // --- Scrollable Content Section ---
                  Expanded(child: contentBuilder(context, scrollController)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
