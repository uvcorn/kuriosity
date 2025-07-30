import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/c_search_bar/c_search_bar.dart';

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.backgroundLightGray,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      alignment: Alignment.bottomCenter,
      child: CSearchbar(hinttext: 'Search', hasBackground: true, height: 50),
    );
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
