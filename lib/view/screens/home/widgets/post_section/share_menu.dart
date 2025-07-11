// comon_post_action_sheet.dart
import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/common_bottom_shit/common_bottom_sheet.dart';

class ShareMenu extends StatelessWidget {
  const ShareMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CommonBottomSheet(
      initialChildSize: 0.25,
      minChildSize: 0.25,
      maxChildSize: 0.25,
      // Now using contentBuilder
      contentBuilder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.sharetitle,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        CustomImage(imageSrc: AppIcons.linkdin),
                        Text(
                          AppStrings.linkedin,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        CustomImage(imageSrc: AppIcons.twitter),
                        Text(
                          AppStrings.twitter,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        CustomImage(imageSrc: AppIcons.facebookba),
                        Text(
                          AppStrings.facebook,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        CustomImage(imageSrc: AppIcons.whatsapp),
                        Text(
                          AppStrings.whatsapp,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
