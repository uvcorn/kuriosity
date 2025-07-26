import 'package:get/get.dart';

import '../../../../utils/app_strings/app_strings.dart';
import '../models/profile_workshop_model.dart';

class AttendedWorkshopController extends GetxController {
  final RxList<ProfileWorkshopModel> attendedWorkshops =
      <ProfileWorkshopModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    attendedWorkshops.assignAll([
      ProfileWorkshopModel(
        title: AppStrings.attendTitle,
        time: AppStrings.timeDuration,
      ),

      ProfileWorkshopModel(
        title: AppStrings.attendTitle,
        time: AppStrings.timeDuration,
      ),

      ProfileWorkshopModel(
        title: AppStrings.attendTitle,
        time: AppStrings.timeDuration,
      ),
    ]);
  }
}
