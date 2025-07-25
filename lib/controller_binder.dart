import 'package:get/get.dart';

import 'view/components/bottom_nav_bar/bottom_nav_controller.dart';
import 'view/screens/group/controller/auth_controller.dart';
import 'view/screens/group/controller/group_controller.dart';
import 'view/screens/home/controllers/home_controller.dart';
import 'view/screens/home/controllers/post_controller.dart';
import 'view/screens/open_new_workshop/controller/image_picker_grid_controller.dart';
import 'view/screens/open_new_workshop/controller/open_new_workshop_controller.dart';
import 'view/screens/post/controllers/create_post_controller.dart';
// import 'view/screens/power_section/controllers/registration_power_use_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.put(BottomNavController());
    Get.lazyPut<CreatePostController>(() => CreatePostController());
    // Get.lazyPut<PostController>(() => PostController());
    Get.lazyPut<GroupController>(() => GroupController());
    Get.put(HomeController());
    Get.put(PostController());
    Get.put(OpenWorkshopController());
    Get.put(ImagePickerGridController());

    // Get.Put<HomeController>(() => HomeController());
    // Get.lazyPut<RegistrationPowerUserController>(
    //   () => RegistrationPowerUserController(),
    // );
  }
}
