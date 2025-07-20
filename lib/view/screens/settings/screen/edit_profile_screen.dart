import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final String userName = "Tony Lens";
    final String userTitle = "Environmentalist";
    final String userBio =
        "I've got some left red wine in my fridge, does anyone know how to recycle it?";
    final String userGoal =
        "I've got some left red wine in my fridge, does anyone know how to recycle it?";
    final List<String> userInterests = [
      "Fashion",
      "Upcycling",
      "Dining Out",
      "Reading",
      "Hiking",
      "Cooking",
      "Photography",
    ];

    const double backgroundImageHeight = 240.0;
    const double profileAvatarRadius = 50.0;
    const double cardTopOverlap = 40.0;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Background Image
            CustomNetworkImage(
              imageUrl: AppConstants.flowerbutterfly,
              height: backgroundImageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Profile Image - Positioned at the top
            Positioned(
              top: 190, // Align the profile image right at the top
              left: MediaQuery.of(context).size.width / 2 - profileAvatarRadius,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: profileAvatarRadius,
                    backgroundColor: AppColors.white,
                    child: ClipOval(
                      child: CustomNetworkImage(
                        imageUrl: AppConstants.profileImage,
                        height: profileAvatarRadius * 2,
                        width: profileAvatarRadius * 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Edit button for profile image (on the bottom-right corner of the avatar)
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: CustomImage(imageSrc: AppIcons.pen, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Profile Info Container - Positioned below the profile image
            Container(
              margin: EdgeInsets.only(
                top:
                    backgroundImageHeight +
                    profileAvatarRadius -
                    cardTopOverlap,
                left: 16,
                right: 16,
              ),
              padding: EdgeInsets.only(
                top: profileAvatarRadius + 20,
                left: 16,
                right: 16,
                bottom: 24,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  _buildInfoRow(
                    textTheme,
                    "Name",
                    userName,
                    isMultiLine: false,
                  ),
                  const Divider(color: AppColors.lightGray),
                  _buildInfoRow(
                    textTheme,
                    "Title",
                    userTitle,
                    isMultiLine: false,
                  ),
                  const Divider(color: AppColors.lightGray),
                  _buildInfoRow(textTheme, "Bio", userBio, isMultiLine: true),
                  const Divider(color: AppColors.lightGray),
                  _buildInfoRow(textTheme, "Goal", userGoal, isMultiLine: true),

                  const SizedBox(height: 16),
                  // Interests Section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          "Interest",
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: userInterests
                              .map(
                                (interest) =>
                                    _buildInterestChip(textTheme, interest),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                  // Done Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 3,
                      ),
                      child: Text(
                        "Done",
                        style: textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    TextTheme textTheme,
    String label,
    String value, {
    required bool isMultiLine,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: isMultiLine
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: textTheme.bodyMedium?.copyWith(),
              maxLines: isMultiLine ? null : 1,
              overflow: isMultiLine ? TextOverflow.clip : TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestChip(TextTheme textTheme, String interest) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        interest,
        style: textTheme.bodySmall?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
