// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kuriosity/utils/app_icons/app_icons.dart';
import 'package:kuriosity/view/components/custom_image/custom_image.dart';
import '../../../../../utils/app_colors/app_colors.dart';

class ComonPostActionSheet extends StatefulWidget {
  const ComonPostActionSheet({super.key}); // Update constructor

  @override
  State<ComonPostActionSheet> createState() => _ComonPostActionSheetState();
}

class _ComonPostActionSheetState extends State<ComonPostActionSheet> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      expand: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundLightGray,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 8),
                      child: Container(
                        width: 32,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34, top: 29),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Unfollow');
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          CustomImage(imageSrc: AppIcons.remove, size: 24),

                          SizedBox(width: 23),
                          Text(
                            'Unfollow',
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
                        print('Hide');
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          CustomImage(imageSrc: AppIcons.hide, size: 24),
                          SizedBox(width: 23),
                          Text(
                            'Hide',
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
                        print('Clip');
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          CustomImage(imageSrc: AppIcons.save, size: 24),

                          SizedBox(width: 23),
                          Text(
                            'Clip',
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
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
