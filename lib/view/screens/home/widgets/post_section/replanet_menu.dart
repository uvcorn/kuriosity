// comon_post_action_sheet.dart
import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../comment_section/add_thought_in_replant.dart';
import '../../../../components/common_bottom_shit/common_bottom_sheet.dart';

class ReplanetMenu extends StatelessWidget {
  const ReplanetMenu({super.key});

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
                  final textTheme = Theme.of(context).textTheme;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: AppColors.lightBlueBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      content: Row(
                        children: [
                          CustomImage(imageSrc: AppIcons.ecob, size: 24),
                          const SizedBox(width: 12),
                          Text(
                            AppStrings.replantSnackbar,
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );

                  Navigator.pop(context);
                },

                child: Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.ecob, size: 24),
                    SizedBox(width: 23),
                    Text(
                      AppStrings.rePlanet,
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
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) =>
                        const AddThoughtInReplant(),
                  );
                },
                child: Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.pen, size: 24),
                    SizedBox(width: 23),
                    Text(
                      AppStrings.pentext,
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
