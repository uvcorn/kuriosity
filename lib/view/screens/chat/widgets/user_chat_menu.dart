// comon_post_action_sheet.dart
import 'package:flutter/material.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/common_bottom_shit/common_bottom_sheet.dart';

class UserChatMenu extends StatelessWidget {
  const UserChatMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CommonBottomSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.2,
      // Now using contentBuilder
      contentBuilder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.only(left: 34),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.remove, size: 24),
                    SizedBox(width: 23),
                    Text(
                      AppStrings.unfollowButton,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 22),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.lock, size: 24),
                    SizedBox(width: 23),
                    Text(
                      AppStrings.blockUser,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
