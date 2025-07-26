import 'dart:io';

import 'package:flutter/material.dart';

class MaterialItem {
  TextEditingController controller;
  File? attachedFile;

  MaterialItem({required this.controller, this.attachedFile});
}
