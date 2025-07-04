import 'package:flutter/material.dart';
import 'package:kuriosity/app/app_theme.dart';

enum ActionButtonType { filled, outlined, text }

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData? icon;
  final double width;
  final double height;
  final double borderRadius;
  final ActionButtonType type;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double elevation;
  final bool iconOnLeft;

  const ActionButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 8,
    this.type = ActionButtonType.filled,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.elevation = 0,
    this.iconOnLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasIcon = icon != null;

    // Default colors based on button type
    Color getDefaultBgColor() {
      switch (type) {
        case ActionButtonType.filled:
          return AppTheme.primaryColor;
        case ActionButtonType.outlined:
          return Colors.transparent; // Typically transparent for outlined
        case ActionButtonType.text:
          return Colors.transparent;
      }
    }

    Color getDefaultTextColor() {
      switch (type) {
        case ActionButtonType.filled:
          return Colors.white;
        case ActionButtonType.outlined:
          return AppTheme.primaryColor; // Or black for social buttons
        case ActionButtonType.text:
          return AppTheme.primaryColor;
      }
    }

    Color getDefaultBorderColor() {
      switch (type) {
        case ActionButtonType.filled:
          return Colors.transparent;
        case ActionButtonType.outlined:
          return AppTheme.primaryColor; // Or light grey for social buttons
        case ActionButtonType.text:
          return Colors.transparent;
      }
    }

    final Color bg = backgroundColor ?? getDefaultBgColor();
    final Color txtColor = textColor ?? getDefaultTextColor();
    final Color brdColor = borderColor ?? getDefaultBorderColor();

    Widget content = hasIcon
        ? Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content in the row
            mainAxisSize: MainAxisSize.min, // Keep row tight to its children
            children: iconOnLeft
                ? [
                    Icon(icon, color: txtColor, size: 24),
                    const SizedBox(width: 12), // Space between icon and text
                    Flexible(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: txtColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]
                : [
                    Flexible(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: txtColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(icon, color: txtColor),
                  ],
          )
        : Text(
            title,
            style: TextStyle(
              color: txtColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          );

    // Determine the button type based on the 'type' property
    Widget buttonWidget;
    switch (type) {
      case ActionButtonType.filled:
        buttonWidget = ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: bg,
            foregroundColor: txtColor,
            elevation: elevation, // Use the provided elevation
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side:
                  BorderSide.none, // Filled buttons usually don't have a border
            ),
          ),
          child: content,
        );
        break;
      case ActionButtonType.outlined:
        buttonWidget = OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: bg,
            foregroundColor: txtColor,
            elevation: elevation, // Outlined buttons can also have elevation
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: brdColor,
                width: 1, // Border thickness for outlined
              ),
            ),
          ),
          child: content,
        );
        break;
      case ActionButtonType.text:
        buttonWidget = TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: bg,
            foregroundColor: txtColor,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: content,
        );
        break;
    }

    return SizedBox(width: width, height: height, child: buttonWidget);
  }
}
