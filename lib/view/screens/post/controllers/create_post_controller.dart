import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkify/linkify.dart';

import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class CreatePostController extends GetxController {
  final textController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();

  final RxnString selectedWorkshop = RxnString();
  final RxList<XFile> pickedImages = <XFile>[].obs;

  final RxnString detectedLink = RxnString();
  final RxBool _linkPreviewDismissedManually = false.obs;
  String? _lastDetectedLink;

  final List<String> workshopOptions = [
    AppStrings.hostWorkshopPost,
    AppStrings.joinWorkshopPost,
  ];

  @override
  void onInit() {
    super.onInit();
    textController.addListener(_detectLinkInText);
  }

  void _detectLinkInText() {
    final text = textController.text;
    final linkElements = linkify(text).whereType<LinkableElement>().toList();

    String? currentLinkInText;
    if (linkElements.isNotEmpty) {
      currentLinkInText = linkElements.first.url;
    }

    if (currentLinkInText == null) {
      detectedLink.value = null;
      _linkPreviewDismissedManually.value = false;
      _lastDetectedLink = null;
      return;
    }

    if (_lastDetectedLink == null) {
      detectedLink.value = currentLinkInText;
      _linkPreviewDismissedManually.value = false;
      _lastDetectedLink = currentLinkInText;
    } else if (currentLinkInText != _lastDetectedLink) {
      detectedLink.value = currentLinkInText;
      _linkPreviewDismissedManually.value = false;
      _lastDetectedLink = currentLinkInText;
    } else {
      if (_linkPreviewDismissedManually.value) {
        detectedLink.value = null;
      } else {
        detectedLink.value = currentLinkInText;
      }
    }
  }

  void clearDetectedLink() {
    detectedLink.value = null;
    _linkPreviewDismissedManually.value = true;
  }

  RxnString get linkToShowPreview {
    if (_linkPreviewDismissedManually.value) {
      return RxnString(null);
    } else {
      return detectedLink;
    }
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        if (pickedImages.length >= 3) {
          SnackbarHelper.show(
            message: AppStrings.youCanAdd3Image,
            isSuccess: true,
          );

          return;
        }
        pickedImages.add(image);
      }
    } catch (e) {
      SnackbarHelper.show(
        message: '$AppStrings.failedToPickImage $e',
        isSuccess: true,
      );
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < pickedImages.length) {
      pickedImages.removeAt(index);
    }
  }

  void selectWorkshop(String value) {
    selectedWorkshop.value = value;
  }

  void reset() {
    textController.clear();
    pickedImages.clear();
    selectedWorkshop.value = null;
    detectedLink.value = null;
    _linkPreviewDismissedManually.value = false;
    _lastDetectedLink = null;
  }

  @override
  void onClose() {
    textController.removeListener(_detectLinkInText);
    textController.dispose();
    super.onClose();
  }
}
