import 'package:get/get.dart';

import '../models/profile_workshop_model.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class AttendedWorkshopController extends GetxController {
  final RxList<ProfileWorkshopModel> attendedWorkshops =
      <ProfileWorkshopModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    attendedWorkshops.assignAll([
      ProfileWorkshopModel(
        title: AppStrings.attendTitle,
        time: AppStrings.timeduration,
      ),

      ProfileWorkshopModel(
        title: AppStrings.attendTitle,
        time: AppStrings.timeduration,
      ),

      ProfileWorkshopModel(
        title: AppStrings.attendTitle,
        time: AppStrings.timeduration,
      ),
    ]);
  }
}
