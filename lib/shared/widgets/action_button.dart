import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kuriosity/app/app_theme.dart';

enum ActionButtonType { filled, outlined, text }

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String? icon; // SVG asset path
  final double width;
  final double height;
  final double borderRadius;
  final ActionButtonType type;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double elevation;
  final double iconTextSpacing;

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
    this.iconTextSpacing = 0, //
  });

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;

    final bg =
        backgroundColor ??
        (type == ActionButtonType.filled
            ? AppTheme.primaryColor
            : Colors.transparent);
    final txtColor =
        textColor ??
        (type == ActionButtonType.filled
            ? Colors.white
            : AppTheme.primaryColor);
    final brdColor =
        borderColor ??
        (type == ActionButtonType.outlined
            ? AppTheme.primaryColor
            : Colors.transparent);

    final iconWidget = hasIcon
        ? Padding(
            padding: EdgeInsets.only(left: 16, right: iconTextSpacing),
            child: SvgPicture.asset(
              icon!,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(txtColor, BlendMode.srcIn),
            ),
          )
        : const SizedBox(width: 16); // keeps layout alignment consistent

    final child = Row(
      children: [
        if (hasIcon) iconWidget,
        Expanded(
          child: Center(
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
        ),
        // Add a right-side placeholder for symmetry
        if (hasIcon)
          SizedBox(
            width: 16 + 24 + iconTextSpacing,
          ) // left padding + icon + spacing
        else
          const SizedBox(width: 16),
      ],
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: BorderSide(color: brdColor),
    );

    final button = switch (type) {
      ActionButtonType.filled => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          elevation: elevation,
          padding: EdgeInsets.zero,
          shape: shape,
        ),
        child: child,
      ),
      ActionButtonType.outlined => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: bg,
          padding: EdgeInsets.zero,
          shape: shape,
        ),
        child: child,
      ),
      ActionButtonType.text => TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bg,
          padding: EdgeInsets.zero,
          shape: shape,
        ),
        child: child,
      ),
    };

    return SizedBox(width: width, height: height, child: button);
  }
}
