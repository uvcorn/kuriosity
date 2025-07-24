import 'package:flutter/material.dart';

class EditingInfoRow extends StatelessWidget {
  final TextTheme textTheme;
  final String label;
  final TextEditingController controller;
  final bool isMultiLine;
  const EditingInfoRow({
    super.key,
    required this.textTheme,
    required this.label,
    required this.controller,
    required this.isMultiLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: isMultiLine
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              style: textTheme.bodyMedium,
              maxLines: isMultiLine ? null : 1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
