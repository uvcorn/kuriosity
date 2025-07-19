import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/custom_link_preview/custom_link_preview.dart';
import '../controllers/post_controller.dart';
import '../../../../utils/app_colors/app_colors.dart';

class PostInputField extends StatelessWidget {
  final PostController controller;

  const PostInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller.textController,
          maxLines: null,
          minLines: 12,
          decoration: InputDecoration(
            hintText: 'What’s on your mind?',
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        Obx(() {
          final previewUrl = controller.linkToShowPreview.value;
          if (previewUrl != null && previewUrl.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomLinkPreview(
                    url: previewUrl,
                    onPreviewLoad: (success) {
                      if (!success) {
                        controller.detectedLink.value = null;
                      }
                    },
                  ),

                  // AnyLinkPreview(
                  //   link: previewUrl,
                  //   cache: const Duration(hours: 1),
                  //   displayDirection: UIDirection.uiDirectionHorizontal,
                  //   showMultimedia: true,
                  //   bodyMaxLines: 3,
                  //   bodyTextOverflow: TextOverflow.ellipsis,
                  //   errorBody: AppStrings.notLoad,
                  //   errorTitle: AppStrings.notLoad,
                  //   errorWidget: Container(
                  //     color: Colors.grey[300],
                  //     padding: const EdgeInsets.all(8),
                  //     child: const Text(AppStrings.notLoad),
                  //   ),
                  //   borderRadius: 12,
                  //   removeElevation: true,
                  // ),
                  Positioned(
                    top: -8,
                    right: -8,
                    child: GestureDetector(
                      onTap: controller.clearDetectedLink,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.gray, width: 1.0),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.black,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ],
    );
  }
}
