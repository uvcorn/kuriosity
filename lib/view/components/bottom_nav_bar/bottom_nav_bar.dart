import 'package:flutter/material.dart';
import '../../../utils/app_colors/app_colors.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.gray,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Group'),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Post',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Note'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
