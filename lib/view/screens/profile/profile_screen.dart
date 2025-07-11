import 'package:flutter/material.dart';
import 'package:kuriosity/utils/app_colors/app_colors.dart';
import 'package:kuriosity/utils/app_const/app_const.dart';
import 'package:kuriosity/utils/app_icons/app_icons.dart';
import 'package:kuriosity/view/components/custom_appbar/coustom_appbar.dart';
import 'package:kuriosity/view/components/custom_image/custom_image.dart';
import 'package:kuriosity/view/components/custom_netwrok_image/custom_network_image.dart';

import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_strings.dart/app_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,

      body: Column(
        children: [
          Stack(
            children: [
              CustomNetworkImage(
                imageUrl: AppConstants.vegatable,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0, // Ensures full width
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      CustomImage(imageSrc: AppImages.whitelogo),
                      SizedBox(width: 16),
                      Text(
                        AppStrings.appTitle,
                        style: textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      CustomImage(imageSrc: AppIcons.bar),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 140,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: CircleAvatar(
                  radius: 55,
                  child: CustomNetworkImage(
                    imageUrl: AppConstants.profileImage,
                    height: 135,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
