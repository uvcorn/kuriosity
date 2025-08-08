import 'package:get/get.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../models/post_model.dart';

class PostCardController extends GetxController {
  final Post post;
  final reactedReactions = <String>[].obs;

  PostCardController({required this.post}) {
    selectedReactionIconPath.value =
        post.selectedReactionIcon ?? AppIcons.handshake;
    reactedReactions.value = List<String>.from(
      post.reactedReactions,
    ); // initialize from post
  }
  // PostCardController({required this.post}) {
  //   selectedReactionIconPath.value =
  //       post.selectedReactionIcon ?? AppIcons.handshake;
  // }

  final selectedReactionIconPath = ''.obs;
  final showReactionOptions = false.obs;

  void toggleReactionOptions() {
    showReactionOptions.value = !showReactionOptions.value;
  }

  void selectReaction(String iconPath) {
    selectedReactionIconPath.value = iconPath;
    showReactionOptions.value = false;
  }

  final isFollowing = false.obs;

  void toggleFollow() {
    isFollowing.value = !isFollowing.value;
  }
}
