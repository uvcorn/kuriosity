// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';
import '../screen/interest_screen.dart';
import 'widgets/editing_info_row.dart';
import 'widgets/image_select_menu.dart';
import 'widgets/interestchip.dart'; // Assuming this widget can handle File as well

class PersonalDetailsEditScreen extends StatefulWidget {
  const PersonalDetailsEditScreen({super.key});

  @override
  State<PersonalDetailsEditScreen> createState() =>
      _PersonalDetailsEditScreenState();
}

class _PersonalDetailsEditScreenState extends State<PersonalDetailsEditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();

  List<String> userInterests = [];

  File? _profileImageFile;
  File? _backgroundImageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController.text = AppStrings.userName;
    _titleController.text = AppStrings.userTitle;
    _bioController.text = AppStrings.demoBio;
    _goalController.text = AppStrings.demoBio;
    userInterests = [];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _titleController.dispose();
    _bioController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(
    ImageSource source, {
    required bool isProfileImage,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          if (isProfileImage) {
            _profileImageFile = File(pickedFile.path);
          } else {
            _backgroundImageFile = File(pickedFile.path);
          }
        });
      }
    } catch (e) {
      SnackbarHelper.show(
        message: "$AppStrings.youCanAdd3Image $e",
        isSuccess: false,
      );
    }
  }

  Widget _buildImageWidget({
    required String networkImageUrl,
    File? file,
    required double height,
    required double width,
    required BoxFit fit,
    required BorderRadius borderRadius,
  }) {
    if (file != null) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image.file(
          file,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: borderRadius,
        child: CustomNetworkImage(
          imageUrl: networkImageUrl,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.04;
    final double verticalSpacing = screenHeight * 0.02;
    final double coverImageHeight = screenHeight * 0.25;
    final double profileImageRadius = screenWidth * 0.12;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              SizedBox(height: verticalSpacing + 30),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background Image
                  _buildImageWidget(
                    networkImageUrl: AppConstants.vegatable,
                    file: _backgroundImageFile,
                    height: coverImageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  Positioned(
                    top: coverImageHeight * 0.1,
                    right: horizontalPadding,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (_) => ImageSelectMenu(
                            isProfileImage: false,
                            onImagePicked: _pickImage,
                          ),
                        );
                      },

                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.lightBlueBackground.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: CustomImage(imageSrc: AppIcons.pencil, size: 20),
                      ),
                    ),
                  ),
                  // Profile Image and Info Container
                  Padding(
                    padding: EdgeInsets.only(
                      top: coverImageHeight - profileImageRadius,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              padding: EdgeInsets.only(
                                top: profileImageRadius + 20,
                                left: horizontalPadding,
                                right: horizontalPadding,
                                bottom: verticalSpacing,
                              ),
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Name
                                  EditingInfoRow(
                                    isMultiLine: false,
                                    textTheme: textTheme,
                                    label: AppStrings.nameString,
                                    controller: _nameController,
                                  ),
                                  Divider(
                                    color: AppColors.lightBorder,
                                    height: verticalSpacing,
                                    thickness: 2,
                                  ),
                                  // Title
                                  EditingInfoRow(
                                    textTheme: textTheme,
                                    label: AppStrings.titleString,
                                    controller: _titleController,
                                    isMultiLine: false,
                                  ),
                                  Divider(
                                    color: AppColors.lightBorder,
                                    height: verticalSpacing,
                                    thickness: 2,
                                  ),
                                  // Bio
                                  EditingInfoRow(
                                    textTheme: textTheme,
                                    label: AppStrings.bioLabel,
                                    controller: _bioController,
                                    isMultiLine: true,
                                  ),
                                  Divider(
                                    color: AppColors.lightBorder,
                                    height: verticalSpacing,
                                    thickness: 2,
                                  ),
                                  // Goal
                                  EditingInfoRow(
                                    textTheme: textTheme,
                                    label: AppStrings.goalLabel,
                                    controller: _goalController,
                                    isMultiLine: true,
                                  ),
                                  Divider(
                                    color: AppColors.lightBorder,
                                    height: verticalSpacing,
                                    thickness: 2,
                                  ),
                                  SizedBox(height: verticalSpacing),
                                  // Interests Section
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () async {
                                      final result = await Get.to(
                                        () => InterestScreen(
                                          initialSelectedInterests: List.from(
                                            userInterests,
                                          ),
                                        ),
                                      );

                                      if (result != null &&
                                          result is List<String>) {
                                        setState(() {
                                          userInterests = result;
                                        });
                                      }
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.15,
                                          child: Text(
                                            AppStrings.interest,
                                            style: textTheme.bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Wrap(
                                            spacing: 8.0,
                                            runSpacing: 8.0,
                                            children: userInterests
                                                .map(
                                                  (interest) => Interestchip(
                                                    interest: interest,
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColors.black,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: verticalSpacing),
                                  // Done Button
                                  Center(
                                    child: SizedBox(
                                      height: 45,
                                      width: screenWidth * 0.3,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          AppStrings.done,
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Profile Avatar
                            Positioned(
                              top: -profileImageRadius,
                              left: screenWidth / 2 - profileImageRadius,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: profileImageRadius,
                                    backgroundColor: AppColors.white,
                                    child: _buildImageWidget(
                                      networkImageUrl:
                                          AppConstants.profileImage,
                                      file: _profileImageFile,
                                      height: profileImageRadius * 2,
                                      width: profileImageRadius * 2,
                                      fit: BoxFit.cover,
                                      borderRadius: BorderRadius.circular(
                                        profileImageRadius,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          builder: (_) => ImageSelectMenu(
                                            isProfileImage: true,
                                            onImagePicked: _pickImage,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: AppColors.lightBlueBackground
                                              .withOpacity(0.8),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CustomImage(
                                          imageSrc: AppIcons.pencil,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: verticalSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
