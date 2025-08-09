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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio<String>(
              value: user,
              groupValue: selected ? user : null,
              onChanged: (_) => onTap(),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            const SizedBox(width: 8),
            Text(user, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
