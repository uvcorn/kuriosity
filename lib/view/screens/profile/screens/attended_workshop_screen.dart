import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../home/controllers/post_controller.dart';
import '../../home/widgets/post_section/post_card/post_card.dart';

class AttendedWorkshopScreen extends StatefulWidget {
  const AttendedWorkshopScreen({super.key});

  @override
  State<AttendedWorkshopScreen> createState() => _AttendedWorkshopScreenState();
}

class _AttendedWorkshopScreenState extends State<AttendedWorkshopScreen> {
  final PostController postController = Get.find<PostController>();
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Get.back(),
                  ),
                  Text(
                    AppStrings.attendw,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                constraints: BoxConstraints(
                  maxHeight: _isExpanded
                      ? Get.height * 0.85
                      : Get.height * 0.15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.attendTitle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: textTheme.bodySmall?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              AppStrings.timeDuration,
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'View related history',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: AppColors.mediumGray,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  _isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: AppColors.mediumGray,
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (_isExpanded)
                          Flexible(
                            child: Obx(() {
                              final attendedWorkshop = postController.posts
                                  .where((post) => post.isWorkshop == true)
                                  .toList();

                              if (attendedWorkshop.isEmpty) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      AppStrings.blankClippedPosts,
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.mediumGray,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                itemCount: attendedWorkshop.length,
                                shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(), // Keep this if only outer scroll is desired
                                physics:
                                    const ClampingScrollPhysics(), // Can try this if content still gets cut off unexpectedly
                                itemBuilder: (context, index) {
                                  final post = attendedWorkshop[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: PostCard(
                                      item: post,
                                      followButton: post.followButton,
                                    ),
                                  );
                                },
                              );
                            }),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
