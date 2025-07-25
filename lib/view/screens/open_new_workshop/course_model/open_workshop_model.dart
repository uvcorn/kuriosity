import 'package:flutter/material.dart';

class OpenWorkshopModel {
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;

  OpenWorkshopModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });
}
