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
        id: '1',
        title: AppStrings.attendTitle,
        time: AppStrings.timeDuration,
      ),

      ProfileWorkshopModel(
        id: '2',
        title: AppStrings.attendTitle,
        time: AppStrings.timeDuration,
      ),

      ProfileWorkshopModel(
        id: '3',
        title: AppStrings.attendTitle,
        time: AppStrings.timeDuration,
      ),
    ]);
  }
}
