import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxList<String> interests = ['Fashion', 'Upcycling', 'Dining Out'].obs;
  final RxBool isPremium = true.obs;

  void updateInterests(List<String> newInterests) {
    interests.assignAll(newInterests);
  }

  void togglePremiumStatus() {
    isPremium.toggle();
  }
}
