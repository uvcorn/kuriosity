import 'package:get/get.dart';
import '../models/post_model.dart';

class PostCardController extends GetxController {
  final Post post;

  PostCardController({required this.post}) {
    // Initialize from the Post model
    selectedReactionIconPath.value = post.selectedReactionIcon ?? '';
    reactionIconPaths.value = post.reactedReactions.take(3).toList();
  }

  var isFollowing = false.obs;
  var showReactionOptions = false.obs;
  var selectedReactionIconPath = ''.obs;

  var reactionIconPaths = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    selectedReactionIconPath.value = post.selectedReactionIcon ?? '';
    if (post.reactedReactions.isNotEmpty) {
      reactionIconPaths.assignAll(post.reactedReactions.take(3));
    }
  }

  void toggleReactionOptions() {
    showReactionOptions.value = !showReactionOptions.value;
  }

  void selectReaction(String iconPath) {
    if (iconPath.isEmpty) return;

    selectedReactionIconPath.value = iconPath;

    if (!reactionIconPaths.contains(iconPath)) {
      if (reactionIconPaths.length >= 3) {
        reactionIconPaths.removeAt(0);
      }
      reactionIconPaths.add(iconPath);
    }

    showReactionOptions.value = false;
  }

  void toggleFollow() {
    isFollowing.value = !isFollowing.value;
  }
}
