import 'package:get/get.dart';

import 'view/components/bottom_nav_bar/bottom_nav_controller.dart';
import 'view/screens/group/controller/auth_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(BottomNavController());
  }
}
