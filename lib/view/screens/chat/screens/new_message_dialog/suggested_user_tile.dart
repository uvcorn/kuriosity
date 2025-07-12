import 'package:flutter/material.dart';

class SuggestedUserTile extends StatelessWidget {
  final String user;
  final bool selected;
  final VoidCallback onTap;

  const SuggestedUserTile({
    required this.user,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Radio<String>(
            value: user,
            groupValue: selected ? user : null,
            onChanged: (_) => onTap(),
          ),
          Text(user),
        ],
      ),
    );
  }
}
