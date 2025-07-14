// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../utils/app_colors/app_colors.dart';

class InputCardContainer extends StatelessWidget {
  final List<Widget> children;
  final double borderRadius;
  final Color backgroundColor;
  final double elevation;
  final double minHeight;
  final Color shadowColor;
  final EdgeInsetsGeometry padding;

  const InputCardContainer({
    super.key,
    required this.children,
    this.borderRadius = 12,
    this.backgroundColor = AppColors.backgroundWhite,
    this.elevation = 4,
    this.shadowColor = AppColors.black,
    this.padding = const EdgeInsets.only(left: 0),
    required this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    final double heightPerChild = minHeight / children.length;
    return Material(
      elevation: elevation,
      shadowColor: shadowColor.withOpacity(0.05),
      borderRadius: BorderRadius.circular(borderRadius),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _withDividers(
                children
                    .map(
                      (child) => SizedBox(height: heightPerChild, child: child),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _withDividers(List<Widget> widgets) {
    if (widgets.length <= 1) return widgets;

    final List<Widget> separated = [];
    for (int i = 0; i < widgets.length; i++) {
      separated.add(Padding(padding: padding, child: widgets[i]));

      if (i != widgets.length - 1) {
        separated.add(
          const Divider(color: AppColors.lightBorder, height: 1, thickness: 1),
        );
      }
    }
    return separated;
  }
}
