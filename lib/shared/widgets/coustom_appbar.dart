import 'package:flutter/material.dart';
import 'package:kuriosity/app/app_theme.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // titleSpacing: 0,
      title: Row(
        children: [
          Icon(Icons.favorite, size: 36, color: AppTheme.primaryColor),
          const SizedBox(width: 8),
          const Text('WIld Curiosity'),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
