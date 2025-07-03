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
    this.height = 48,
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
          return Colors.transparent;
        case ActionButtonType.text:
          return Colors.transparent;
      }
    }

    Color getDefaultTextColor() {
      switch (type) {
        case ActionButtonType.filled:
          return Colors.white;
        case ActionButtonType.outlined:
          return AppTheme.primaryColor;
        case ActionButtonType.text:
          return AppTheme.primaryColor;
      }
    }

    Color getDefaultBorderColor() {
      switch (type) {
        case ActionButtonType.filled:
          return Colors.transparent;
        case ActionButtonType.outlined:
          return AppTheme.primaryColor;
        case ActionButtonType.text:
          return Colors.transparent;
      }
    }

    final Color bg = backgroundColor ?? getDefaultBgColor();
    final Color txtColor = textColor ?? getDefaultTextColor();
    final Color brdColor = borderColor ?? getDefaultBorderColor();

    Widget content = hasIcon
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: iconOnLeft
                ? [
                    Icon(icon, color: txtColor),
                    const SizedBox(width: 8),
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

    final ButtonStyle style =
        ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: txtColor,
          elevation: type == ActionButtonType.filled ? elevation : 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: brdColor,
              width: type == ActionButtonType.outlined ? 1.5 : 0,
            ),
          ),
        ).copyWith(
          elevation: WidgetStateProperty.all(
            type == ActionButtonType.filled ? elevation : 0,
          ),
          side: WidgetStateProperty.all(
            type == ActionButtonType.outlined
                ? BorderSide(color: brdColor, width: 1.5)
                : BorderSide.none,
          ),
          backgroundColor: WidgetStateProperty.all(bg),
          foregroundColor: WidgetStateProperty.all(txtColor),
        );

    return SizedBox(
      width: width,
      height: height,
      child: type == ActionButtonType.text
          ? TextButton(onPressed: onPressed, style: style, child: content)
          : ElevatedButton(onPressed: onPressed, style: style, child: content),
    );
  }
}
