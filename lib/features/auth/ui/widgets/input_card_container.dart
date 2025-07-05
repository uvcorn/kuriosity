import 'package:flutter/material.dart';

class InputCardContainer extends StatelessWidget {
  final List<Widget> children;
  final double borderRadius;
  final Color backgroundColor;
  final double elevation;
  final Color shadowColor;
  final EdgeInsetsGeometry padding;

  const InputCardContainer({
    super.key,
    required this.children,
    this.borderRadius = 12,
    this.backgroundColor = Colors.white,
    this.elevation = 4,
    this.shadowColor = Colors.black,
    this.padding = const EdgeInsets.only(left: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shadowColor: shadowColor.withOpacity(0.05),
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _withDividers(children),
          ),
        ),
      ),
    );
  }

  /// Helper to automatically insert dividers between children.
  List<Widget> _withDividers(List<Widget> widgets) {
    if (widgets.length <= 1) return widgets;

    final List<Widget> separated = [];
    for (int i = 0; i < widgets.length; i++) {
      separated.add(widgets[i]);
      if (i != widgets.length - 1) {
        separated.add(
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.grey[300],
            indent: 5,
            endIndent: 5,
          ),
        );
      }
    }
    return separated;
  }
}
