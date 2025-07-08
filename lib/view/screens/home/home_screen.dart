import 'package:flutter/material.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_images/app_images.dart';
import '../../components/custom_appbar/coustom_appbar.dart';

import 'widgets/post_card.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/post_model.dart';
import 'widgets/search_bar_delegater.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showSearchBar = false;

  final List<Post> postData = [
    Post(
      username: 'Wendy Suzuki',
      userImage: AppImages.profile,
      postImage: AppImages.post,
      userSubtitle: 'Self-taught sewist',
      postOverlayText: 'Self-taught sewist\n& Upcycler',
      caption:
          'Celebrating women-owned brands, ethical fashion,& #internationalwomensday with @wolfandbadger and some incredible women ...more',
      likes: '19',
      comments: '23',
      seeds: '4',
      shares: '23',
    ),
    Post(
      username: 'Daniel Maier',
      userImage: AppImages.profile,
      videoUrl:
          'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
      userSubtitle: 'Food prep & workout',
      postOverlayText: 'Joining "Grow veg and herbs at home"',
      caption:
          'So proud of our little garden this year! We’ve been flying around the pest few weeks, ...more',
      likes: '10',
      comments: '20',
      seeds: '3',
      shares: '15',
    ),
    Post(
      username: 'Daniel Maier',
      userImage: AppImages.profile,
      postImage: AppImages.post,
      userSubtitle: 'Food prep & workout',
      postOverlayText: 'Joining "Grow veg and herbs at home"',
      caption: 'So proud of our little garden this year! ...',
      likes: '10',
      comments: '20',
      seeds: '3',
      shares: '15',
    ),
    Post(
      username: 'Amy Hyman',
      userImage: AppImages.profile,
      postImage: AppImages.post,
      userSubtitle: 'Happy homemaker',
      postOverlayText: 'Happy thoughts!',
      caption: '💛 I loved this caption! I can\'t wait to join...',
      likes: '5',
      comments: '10',
      seeds: '1',
      shares: '5',
    ),
    Post(
      username: 'Tony Lane',
      userImage: AppImages.profile,
      postImage: AppImages.post,
      userSubtitle: 'Wine enthusiast',
      postOverlayText: 'Good wine, good times',
      caption: 'I\'ve got some left red wine in my fridge...',
      likes: '15',
      comments: '25',
      seeds: '5',
      shares: '18',
    ),
    // Add more posts as needed
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final offset = _scrollController.offset;
    if (offset > 50 && !_showSearchBar) {
      setState(() => _showSearchBar = true);
    } else if (offset < 50 && _showSearchBar) {
      setState(() => _showSearchBar = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLightGray,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: false,
              expandedHeight: 40,
              flexibleSpace: FlexibleSpaceBar(
                background: CustomAppbar(iconPath: AppIcons.chat),
              ),
            ),
            if (_showSearchBar)
              SliverPersistentHeader(
                pinned: true,
                delegate: SearchBarDelegate(),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => PostCard(item: postData[index]),
                childCount: postData.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
