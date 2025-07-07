import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool? showCheckbox;
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  final String leadingText;
  final TextStyle? leadingTextStyle;
  final String clickableText;
  final TextStyle? clickableTextStyle;
  final VoidCallback onLinkTap;
  final bool useSpaceBetweenAlignment;
  final bool centerAlignment;

  const CustomCheckbox({
    super.key,
    this.showCheckbox,
    this.value,
    this.onChanged,
    required this.leadingText,
    this.leadingTextStyle,
    required this.clickableText,
    this.clickableTextStyle,
    required this.onLinkTap,
    this.useSpaceBetweenAlignment = false,
    this.centerAlignment = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final MainAxisAlignment mainRowAlignment = useSpaceBetweenAlignment
        ? MainAxisAlignment.spaceBetween
        : (centerAlignment
              ? MainAxisAlignment.center
              : MainAxisAlignment.start);

    final bool shouldShowCheckbox =
        showCheckbox == true && value != null && onChanged != null;

    return Row(
      mainAxisAlignment: mainRowAlignment,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (shouldShowCheckbox)
              Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.grey,
                checkColor: Colors.white,
              ),
            Text(
              leadingText,
              style: leadingTextStyle ?? TextStyle(fontSize: 14),
            ),
          ],
        ),

        if (!useSpaceBetweenAlignment) const SizedBox(width: 4),

        if (useSpaceBetweenAlignment) const Spacer(),

        GestureDetector(
          onTap: onLinkTap,
          child: Text(
            clickableText,
            style: clickableTextStyle ?? textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
