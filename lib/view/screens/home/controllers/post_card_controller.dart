import 'package:get/get.dart';

import '../../../../utils/app_icons/app_icons.dart';

class PostCardController extends GetxController {
  var showReactionOptions = false.obs;
  var selectedReactionIconPath = AppIcons.handshake.obs;

  void toggleReactionOptions() {
    showReactionOptions.value = !showReactionOptions.value;
  }

  void selectReaction(String iconPath) {
    selectedReactionIconPath.value = iconPath;
    showReactionOptions.value = false;
  }
}
