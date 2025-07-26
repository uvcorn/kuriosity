import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../../../components/custom_network_image/custom_network_image.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';
import '../controllers/create_post_controller.dart';
import '../widgets/image_preview_grid.dart';
import '../widgets/workshop_selector.dart';
import '../widgets/post_input_field.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreatePostController>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          SafeArea(child: _buildAppBar(context, controller)),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  PostInputField(controller: controller),
                  const SizedBox(height: 12),
                  ImagePreviewGrid(controller: controller),
                  const SizedBox(height: 12),
                  WorkshopSelector(controller: controller),
                  const SizedBox(height: 20),
                  _buildMediaButtons(controller),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, CreatePostController controller) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              controller.reset();
              FocusScope.of(context).unfocus();
              final BottomNavController navcontroller =
                  Get.find<BottomNavController>();
              navcontroller.changeIndex(0);
              Get.back();
            },
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 17,
            child: ClipOval(
              child: CustomNetworkImage(
                imageUrl: AppConstants.profileImage,
                size: 34,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            AppStrings.userName,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              controller.reset();
              FocusScope.of(context).unfocus();
              final BottomNavController navcontroller =
                  Get.find<BottomNavController>();
              navcontroller.changeIndex(0);
              Get.back();
              SnackbarHelper.show(
                message: AppStrings.finishPosting,
                isSuccess: true,
              );
            },
            child: const Text(AppStrings.post),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaButtons(CreatePostController controller) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.image_outlined),
          onPressed: controller.pickedImages.length >= 3
              ? null
              : controller.pickImage,
        ),
        IconButton(icon: const Icon(Icons.videocam_outlined), onPressed: () {}),
        IconButton(
          icon: const Icon(Icons.insert_drive_file_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
