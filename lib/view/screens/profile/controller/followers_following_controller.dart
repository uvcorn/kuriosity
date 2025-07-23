import 'package:get/get.dart';

import '../../../../utils/app_strings/app_strings.dart';

class FollowersFollowingController extends GetxController {
  final RxList<User> followers = <User>[].obs;
  final RxList<User> following = <User>[].obs;
  final RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    followers.assignAll([
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: false,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: false,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: false,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: false,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: false,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: false,
      ),
    ]);
    following.assignAll([
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: true,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: true,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: true,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: true,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: true,
      ),
      User(
        name: AppStrings.userName,
        title: AppStrings.userTitle,
        isFollowing: true,
      ),
    ]);
    isLoading.value = false;
  }

  void toggleFollow(User user) {
    user.isFollowing.toggle();
    update();
  }
}

class User {
  final String name;
  final String title;
  final RxBool isFollowing;
  User({required this.name, required this.title, required bool isFollowing})
    : isFollowing = isFollowing.obs;
}
