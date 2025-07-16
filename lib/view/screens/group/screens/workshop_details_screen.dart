// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/utils/app_strings.dart/app_strings.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';
import '../models/workshop.dart';
import '../widgets/participant_avatar_stack.dart';

class AuthController extends GetxController {
  final RxBool _isPremiumUser = false.obs;

  bool get isPremiumUser => _isPremiumUser.value;

  void upgradeToPremium() {
    _isPremiumUser.value = true;
    Get.snackbar(
      'Success',
      'You are now a premium user!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
    );
  }
}

class WorkshopDetailScreen extends StatefulWidget {
  final Workshop workshop;

  const WorkshopDetailScreen({super.key, required this.workshop});

  @override
  State<WorkshopDetailScreen> createState() => _WorkshopDetailScreenState();
}

class _WorkshopDetailScreenState extends State<WorkshopDetailScreen> {
  final PageController _pageController = PageController(viewportFraction: 1);
  double _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    final textTheme = Theme.of(context).textTheme;
    final List<String> imageSlides = widget.workshop.fullImageUrls ?? [];
    final int totalPages = imageSlides.length;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.35,
                width: Get.width,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: totalPages,
                      itemBuilder: (context, index) {
                        final diff = index - _currentPageValue;
                        final scale = 1.0 - (diff.abs() * 0.1);
                        final offset = diff * (Get.width * 0.03);
                        return Transform.scale(
                          scale: scale.clamp(1, 1),
                          child: Transform.translate(
                            offset: Offset(offset, 0),
                            child: CustomNetworkImage(
                              imageUrl: imageSlides[index],
                              height: Get.height * 0.35,
                              width: Get.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    if (totalPages > 1)
                      Positioned(
                        bottom: Get.height * 0.02,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(totalPages, (index) {
                            int currentIndicatorPage = _currentPageValue
                                .round();
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.01,
                              ),
                              height: Get.width * 0.02,
                              width: Get.width * 0.02,
                              decoration: BoxDecoration(
                                color: currentIndicatorPage == index
                                    ? AppColors.primary
                                    : AppColors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(
                                  Get.width * 0.01,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    Positioned(
                      top: Get.height * 0.02,
                      left: Get.width * 0.04,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.white,
                            size: Get.width * 0.06,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.workshop.title,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                      widget.workshop.title,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),

                    // Instructor Info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: Get.width * 0.045,
                          child: ClipOval(
                            child: CustomNetworkImage(
                              imageUrl: widget.workshop.profileImageUrl,
                              height: Get.width * 0.09,
                              width: Get.width * 0.09,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: Get.width * 0.02),
                        Text(
                          widget.workshop.instructorName,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.workshop.date,
                              style: textTheme.bodySmall?.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.005),
                            Wrap(
                              spacing: Get.width * 0.015,
                              runSpacing: Get.height * 0.005,
                              children: widget.workshop.tags
                                  .map(
                                    (tag) => Chip(
                                      label: Text(tag),
                                      backgroundColor:
                                          AppColors.lightBlueBackground,
                                      labelStyle: textTheme.bodySmall?.copyWith(
                                        color: AppColors.black,
                                        fontSize: Get.width * 0.028,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                        // Rating
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: Get.width * 0.05,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: Get.width * 0.05,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: Get.width * 0.05,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: Get.width * 0.05,
                            ),
                            Icon(
                              Icons.star_half_rounded,
                              color: Colors.amber,
                              size: Get.width * 0.05,
                            ),
                            SizedBox(width: Get.width * 0.01),
                            Text(
                              AppStrings.rating,
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: Get.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),

                    Row(
                      children: [
                        ParticipantAvatarStack(
                          participants: widget.workshop.participants,
                          profileImage2Url: widget.workshop.profileImage2Url,
                        ),
                        SizedBox(width: Get.width * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.workshop.participants} people joining',
                              style: textTheme.bodySmall?.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              widget.workshop.spacesLeft == 0
                                  ? AppStrings.full
                                  : '${widget.workshop.spacesLeft} space left',
                              style: textTheme.labelSmall?.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.03),

                    SizedBox(
                      width: double.infinity,
                      height: Get.height * 0.06,
                      child: ElevatedButton(
                        onPressed:
                            widget.workshop.isFinished ||
                                widget.workshop.spacesLeft == 0
                            ? null
                            : () {
                                Get.snackbar(
                                  AppStrings.regestration,
                                  'You have registered for ${widget.workshop.title}!',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppColors.primary,
                                  colorText: Colors.white,
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          widget.workshop.isFinished
                              ? AppStrings.workshopfinished
                              : widget.workshop.spacesLeft == 0
                              ? AppStrings.full
                              : AppStrings.register,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),

                    Text(
                      AppStrings.workshopdescription,
                      style: textTheme.bodyMedium?.copyWith(),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                      AppStrings.workshopdescriptiondetails,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      AppStrings.workshopdescription,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      AppStrings.workshopdescriptiondetails,
                      style: textTheme.bodyMedium,
                    ),
                    SizedBox(height: 24),
                    Text(
                      AppStrings.whotitle,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildNumberedText(textTheme, '01', AppStrings.whotitle1),
                    const SizedBox(height: 10),
                    _buildNumberedText(textTheme, '02', AppStrings.whotitle2),
                    const SizedBox(height: 10),
                    _buildNumberedText(textTheme, '03', AppStrings.whotitle3),
                    const SizedBox(height: 24),

                    // "Courses" section heading
                    Obx(() {
                      if (authController.isPremiumUser) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Courses',
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Course 1: Introduction to Sustainable Diet',
                              style: textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Course 2: Advanced Meal Planning for Climate Health',
                              style: textTheme.bodyMedium,
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Courses',
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.mediumGray,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 30,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.lightGray.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AppColors.lightGray,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    AppStrings.basicres,
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      authController.upgradeToPremium();
                                    },
                                    child: Text(
                                      AppStrings.becomeprem,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.primary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160,
                                    child: Divider(
                                      color: AppColors.primary,
                                      thickness: 1,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberedText(TextTheme textTheme, String number, String text) {
    return Row(
      children: [
        Text(
          number,
          style: textTheme.bodyMedium?.copyWith(color: AppColors.primary),
        ),
        SizedBox(width: Get.width * 0.02),
        Expanded(child: Text(text, style: textTheme.bodyMedium)),
      ],
    );
  }
}
