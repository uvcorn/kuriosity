// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';

class VideoPickerSection extends StatefulWidget {
  const VideoPickerSection({super.key});

  @override
  _VideoPickerSectionState createState() => _VideoPickerSectionState();
}

class _VideoPickerSectionState extends State<VideoPickerSection> {
  File? _videoFile;

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result != null && result.files.single.path != null) {
      setState(() {
        _videoFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.addVideo,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenHeight * 0.015),
        GestureDetector(
          onTap: _pickVideo,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(10),
                  dashPattern: [3, 5],
                  strokeWidth: 2,
                  color: AppColors.lightBorder,
                ),

                // ),
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Center(
                    child: _videoFile == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.video_library,
                                size: 24,
                                color: AppColors.lightGray,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Video makes your workshops more attractive",
                                style: textTheme.labelSmall,
                              ),
                            ],
                          )
                        : Text(
                            ' ${_videoFile!.path.split('/').last}',
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
