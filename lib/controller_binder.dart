import 'package:get/get.dart';

import 'view/components/bottom_nav_bar/bottom_nav_controller.dart';
// import 'view/screens/edit_profile/controllers/edit_profile_controller.dart';
import 'view/screens/group/controller/auth_controller.dart';
import 'view/screens/post/controllers/post_controller.dart';
// import 'view/screens/power_section/controllers/registration_power_use_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.put(BottomNavController());
    Get.lazyPut<PostController>(() => PostController());
    // Get.lazyPut<RegistrationPowerUserController>(
    //   () => RegistrationPowerUserController(),
    // );
  }
}
