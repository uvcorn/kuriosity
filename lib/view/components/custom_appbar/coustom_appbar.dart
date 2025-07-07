import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kuriosity/utils/app_images/app_images.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      title: Row(
        children: [
          SvgPicture.asset(AppImages.logo, height: 23, width: 26),
          const SizedBox(width: 5),
          Text('Wild Curiosity', style: textTheme.headlineMedium),
        ],
      ),
      // backgroundColor: Colors.white,
    );
  }
}
