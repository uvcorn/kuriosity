import 'package:flutter/material.dart';
import 'package:kuriosity/utils/app_strings.dart/app_strings.dart';
import 'package:kuriosity/view/components/c_search_bar/c_search_bar.dart';

class FollowersFollowingScreen extends StatefulWidget {
  const FollowersFollowingScreen({super.key});

  @override
  State<FollowersFollowingScreen> createState() =>
      _FollowersFollowingScreenState();
}

class _FollowersFollowingScreenState extends State<FollowersFollowingScreen> {
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 24),
            CSearchbar(hinttext: AppStrings.searchHint),
            TabBarView(
              controller: _tabController,
              children: [_buildFollowersTab(), _buildFollowersTab()],
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildFollowersTab() {
    return ListView(children: [UserListItem()]);
  }
}

class UserListItem extends StatelessWidget {
  const UserListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
