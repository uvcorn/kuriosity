import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class ImagePickerGridController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  // Holds 4 nullable image files
  final RxList<File?> images = List<File?>.filled(4, null).obs;

  Future<void> pickImageForIndex(int index) async {
    if (index < 0 || index >= images.length) return;

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        images[index] = File(pickedFile.path);
      }
    } catch (e) {
      SnackbarHelper.show(
        message: "$AppStrings.failedToPickImage $e",
        isSuccess: false,
      );
    }
  }

  void removeImageAtIndex(int index) {
    if (index < 0 || index >= images.length) return;
    images[index] = null;
  }

  ///   Clear all selected images
  void reset() {
    images.value = List<File?>.filled(4, null);
  }

  @override
  void onClose() {
    images.clear(); // Optional: fully dispose images list
    super.onClose();
  }
}
