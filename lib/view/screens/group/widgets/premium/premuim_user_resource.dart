import 'package:flutter/material.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../models/workshop_model.dart';
import '../common/material_section.dart';
import '../common/user_avatar_info_tile.dart';

class Review {
  final String reviewerName;
  final String reviewText;
  final String? reviewerImageUrl;

  Review({
    required this.reviewerName,
    required this.reviewText,
    this.reviewerImageUrl,
  });
}

class PremuimUserResource extends StatefulWidget {
  final WorkshopModel workshop;

  const PremuimUserResource({super.key, required this.workshop});

  @override
  State<PremuimUserResource> createState() => _PremuimUserResourceState();
}

class _PremuimUserResourceState extends State<PremuimUserResource> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Review> _reviews = [
    Review(
      reviewerName: 'Shannon Kim',
      reviewText:
          'Highly recommend it to anyone looking to improve their health.',
      reviewerImageUrl: AppConstants.profile2Image,
    ),
    Review(
      reviewerName: 'John Doe',
      reviewText:
          'Great insights and practical tips. I\'ve seen significant progress since I started.',
      reviewerImageUrl: AppConstants.profileImage,
    ),
    Review(
      reviewerName: 'Jane Smith',
      reviewText:
          'The personalized guidance was incredibly helpful. I feel so much more energized!',
      reviewerImageUrl: AppConstants.profile2Image,
    ),
  ];

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _goToNextPage() {
    if (_currentPage < _reviews.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        MaterialSection(),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.backgroundLightGray),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.meetthehost,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                UserAvatarInfoTile(
                  imageUrl: AppConstants.profileImage,
                  avatarRadius: 37,
                  spacing: 16,
                  infoTexts: [
                    SizedBox(height: 4),
                    Text(
                      AppStrings.userName,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      AppStrings.userTitle,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      AppStrings.location,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
                SizedBox(height: 14),
                Text(
                  AppStrings.hostdescep,
                  style: textTheme.bodySmall?.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.workshopreviewtitle,
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _goToPreviousPage,
                    icon: Icon(Icons.keyboard_arrow_left),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 125,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _reviews.length,
                            onPageChanged: (index) {
                              _currentPage = index;
                            },
                            itemBuilder: (context, index) {
                              final review = _reviews[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '"${review.reviewText}"',
                                      textAlign: TextAlign.center,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    CircleAvatar(
                                      radius: 17,
                                      child: ClipOval(
                                        child: CustomNetworkImage(
                                          imageUrl:
                                              review.reviewerImageUrl ?? '',
                                          size: 34,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      review.reviewerName,
                                      style: textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: _goToNextPage,
                    icon: Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 32),
      ],
    );
  }
}
