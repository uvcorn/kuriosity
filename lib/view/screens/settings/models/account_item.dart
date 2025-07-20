import 'package:flutter/material.dart';

class AccountItem {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  AccountItem({
    required this.title,
    required this.iconPath,
    required this.onTap,
  });
}
