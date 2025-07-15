import 'package:get/get.dart';
import 'package:kuriosity/core/app_routes/app_routes.dart';

class BottomNavController extends GetxController {
  int _currentIndex = 0;
  int get selectedIndex => _currentIndex;
  void changeIndex(int index) {
    if (index == _currentIndex) {
      return;
    }
    _currentIndex = index;
    update();
  }

  void moveToCategory() {
    changeIndex(1);
  }

  void backToHome() {
    changeIndex(0);
    Get.offAllNamed(AppRoutes.bottomNavBar);
  }
}
