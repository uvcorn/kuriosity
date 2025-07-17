// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../controller/auth_controller.dart';
import '../models/course_model.dart';
import '../models/workshop_model.dart';
import '../widgets/instructor_info.dart';
import '../widgets/non_premium_bottom_bar.dart';
import '../widgets/premium_bottom_bar.dart';
import '../widgets/who_should_attend_section.dart';
import '../widgets/workshop_courses_premium.dart';
import '../widgets/workshop_description_section.dart';
import '../widgets/workshop_detail_row.dart';
import '../widgets/workshop_details_appbar.dart';
import '../widgets/workshop_image_carousel.dart';
import '../widgets/workshop_participant_info.dart';

class WorkshopDetailScreen extends StatefulWidget {
  final WorkshopModel workshop;

  const WorkshopDetailScreen({super.key, required this.workshop});

  @override
  State<WorkshopDetailScreen> createState() => _WorkshopDetailScreenState();
}

class _WorkshopDetailScreenState extends State<WorkshopDetailScreen> {
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

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Workshop Title
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
                  // Instructor Info
                  InstructorInfo(
                    instructorName: widget.workshop.instructorName,
                    profileImageUrl: widget.workshop.profileImageUrl,
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
                  SizedBox(height: Get.height * 0.03),

                  Obx(() {
                    if (authController.isRegister.value) {
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'You are currently registered for this workshop',
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
                                'Not interested in joining anymore',
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

                  // Workshop Description Section
                  WorkshopDescriptionSection(),
                  SizedBox(height: Get.height * 0.02),
                  // Who Should Attend Section
                  WhoShouldAttendSection(),
                  const SizedBox(height: 24),
                  // Courses Section (Premium User Check)
                  Obx(() {
                    if (authController.isPremiumUser) {
                      return PremiumCoursesSection(
                        demoCourses: demoCourses,
                        workshop: widget.workshop,
                      );
                    } else {
                      return Text(
                        'Courses',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mediumGray,
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
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
