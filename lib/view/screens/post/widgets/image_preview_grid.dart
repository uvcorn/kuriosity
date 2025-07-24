import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_post_controller.dart';

class ImagePreviewGrid extends StatelessWidget {
  final CreatePostController controller;

  const ImagePreviewGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        spacing: 10,
        runSpacing: 10,
        children: controller.pickedImages.asMap().entries.map((entry) {
          int index = entry.key;
          final image = entry.value;

          return Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(image.path),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () => controller.removeImage(index),
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.black54,
                  child: Icon(Icons.close, size: 14, color: Colors.white),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
