import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../home/widgets/post_section/share_menu.dart';

class WorkshopDetailAppBar extends StatelessWidget {
  const WorkshopDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: AppColors.backgroundWhite,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          Spacer(),
          Text(
            'Workshop',
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) => const ShareMenu(),
              );
            },
            icon: CustomImage(imageSrc: AppIcons.extarnalshare),
          ),
          SizedBox(width: 15),
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
        ],
      ),
    );
  }
}
