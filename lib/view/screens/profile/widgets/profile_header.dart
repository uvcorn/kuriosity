import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';
import 'profile_card.dart';

class ProfileHeader extends StatelessWidget {
  final List<String> interests;

  const ProfileHeader({super.key, required this.interests});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomNetworkImage(
          imageUrl: AppConstants.flowerbutterfly,
          height: 240,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 27,
          left: 16,
          right: 16,
          child: Row(
            children: [
              CustomImage(imageSrc: AppImages.whitelogo),
              const SizedBox(width: 16),
              Text(
                AppStrings.appTitle,
                style: textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
              const Spacer(),
              CustomImage(imageSrc: AppIcons.bar),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 160),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ProfileCard(interests: interests),
                  ),
                  Positioned(
                    top: -50,
                    left: MediaQuery.of(context).size.width / 2 - 66,
                    child: CircleAvatar(
                      radius: 50,
                      child: ClipOval(
                        child: CustomNetworkImage(
                          imageUrl: AppConstants.profileImage,
                          height: 135,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
