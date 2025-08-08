// ignore_for_file: deprecated_member_use, unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../home/widgets/post_section/post_card/media_content.dart';
import '../controller/auth_controller.dart';
import '../models/course_model.dart';
import '../models/workshop_model.dart';
import '../widgets/common/running_workshop.dart';
import '../widgets/common/user_avatar_info_tile.dart';
import '../widgets/non_premium/non_premium_bottom_bar.dart';
import '../widgets/premium/premium_bottom_bar.dart';
import '../widgets/workshop/who_should_attend_section.dart';
import '../widgets/premium/workshop_courses_premium.dart';
import '../widgets/workshop/workshop_description_section.dart';
import '../widgets/workshop/workshop_detail_row.dart';
import '../widgets/workshop/workshop_details_appbar.dart';
import '../widgets/workshop/workshop_image_carousel.dart';
import '../widgets/workshop/workshop_participant_info.dart';

class WorkshopDetailScreen extends StatefulWidget {
  final WorkshopModel workshop;

  const WorkshopDetailScreen({super.key, required this.workshop});

  @override
  State<WorkshopDetailScreen> createState() => _WorkshopDetailScreenState();
}

class _WorkshopDetailScreenState extends State<WorkshopDetailScreen> {
  late VideoPlayerController _videoController;
  final bool _isImageLoading = false;
  final PageController _pageController = PageController(viewportFraction: 1);
  double _currentPageValue = 0.0;
  final List<CourseModel> demoCourses = [
    CourseModel(
      title: 'Grow veg and herbs at home',
      description:
          'Switch to a climate-healthy diet with a professional id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      date: 'WED, 21 May, 12:30 BST',
    ),
    CourseModel(
      title: 'Advanced Composting Techniques',
      description:
          'Dive deep into the world of composting and learn how to create nutrient-rich soil for your garden. This course covers various methods and common pitfalls.',
      date: 'FRI, 28 May, 10:00 BST',
    ),
    CourseModel(
      title: 'Sustainable Water Management for Gardens',
      description:
          'Discover efficient watering strategies to conserve water while ensuring your plants thrive. Topics include drip irrigation, rainwater harvesting, and drought-tolerant plants.',
      date: 'MON, 3 Jun, 14:00 BST',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page ?? 0.0;
      });
    });
    _videoController =
        VideoPlayerController.network(
            'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
          )
          ..initialize()
              .then((_) {
                if (mounted) {
                  setState(() {});
                }
              })
              .catchError((error) {
                if (mounted) {
                  setState(() {});
                }
              });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final textTheme = Theme.of(context).textTheme;
    final List<String> imageSlides = widget.workshop.fullImageUrls ?? [];
    final int totalPages = imageSlides.length;
    bool isworkshopprogressing = false;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              // App Bar
              WorkshopDetailAppBar(),
              // Image Carousel
              WorkshopImageCarousel(
                pageController: _pageController,
                imageSlides: imageSlides,
                currentPageValue: _currentPageValue,
                totalPages: totalPages,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Workshop Title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      children: [
                        Text(
                          widget.workshop.title,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        // Workshop Description
                        Text(
                          widget.workshop.title,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),

                        UserAvatarInfoTile(
                          imageUrl: widget.workshop.profileImageUrl,
                          infoTexts: [
                            Text(
                              widget.workshop.instructorName,
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.02),

                        // Date, Tags and Rating
                        WorkshopDetailsRow(
                          date: widget.workshop.date,
                          tags: widget.workshop.tags,
                        ),
                        SizedBox(height: Get.height * 0.03),
                        // Participants and Spaces Left
                        WorkshopParticipationInfo(
                          participants: widget.workshop.participants,
                          profileImage2Url: widget.workshop.profileImage2Url,
                          spacesLeft: widget.workshop.spacesLeft,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),

                  Obx(() {
                    if (authController.isRegister.value) {
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              AppStrings.alradyregister,
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                authController.cancelRegister();
                              },
                              child: Text(
                                textAlign: TextAlign.center,
                                AppStrings.leaveregister,
                                style: textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 220,
                              child: Divider(
                                color: AppColors.lightBorder,
                                thickness: 1,
                                height: 0,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.03),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),

                  if (isworkshopprogressing = true)
                    RunningWorkshop(textTheme: textTheme),
                  SizedBox(height: Get.height * 0.02),

                  MediaContent(
                    videoController: _videoController,
                    imageUrl: AppConstants.vegatable,
                    isImageLoading: _isImageLoading,
                  ),
                  // Workshop Description Section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      children: [
                        WorkshopDescriptionSection(),
                        SizedBox(height: 24),
                        // Who Should Attend Section
                        WhoShouldAttendSection(),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  // Courses Section (Premium User Check)
                  Obx(() {
                    if (authController.isPremiumUser) {
                      return PremiumCoursesSection(
                        demoCourses: demoCourses,
                        workshop: widget.workshop,
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          AppStrings.course,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mediumGray,
                          ),
                        ),
                      );
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        if (authController.isPremiumUser) {
          return PremiumBottomBar(workshop: widget.workshop);
        } else {
          return NonPremiumBottomBar();
        }
      }),
    );
  }
}
