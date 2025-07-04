// lib/shared/widgets/input_card_container.dart
import 'package:flutter/material.dart';

class InputCardContainer extends StatelessWidget {
  final List<Widget> children;
  final double borderRadius;
  final Color backgroundColor;
  final double elevation;
  final Color shadowColor;
  final EdgeInsetsGeometry padding; // Allow custom padding inside the container

  const InputCardContainer({
    super.key,
    required this.children,
    this.borderRadius = 12,
    this.backgroundColor = Colors.white,
    this.elevation = 4, // Default subtle elevation
    this.shadowColor =
        Colors.black, // Default shadow color, will be adjusted with opacity
    this.padding = const EdgeInsets.only(
      left: 16,
    ), // Default padding as in your original code
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shadowColor: shadowColor.withOpacity(
        0.05,
      ), // Apply subtle opacity for a softer shadow
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: padding, // Use the provided padding
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Ensure column only takes up needed space
            children: children, // Display the passed children
          ),
        ),
      ),
    );
  }
}
