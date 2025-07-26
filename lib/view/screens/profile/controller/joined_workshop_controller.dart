import 'package:get/get.dart';

import '../../../../utils/app_strings/app_strings.dart';
import '../models/profile_workshop_model.dart';

class JoinedWorkshopController extends GetxController {
  final RxList<ProfileWorkshopModel> joinedWorkshops =
      <ProfileWorkshopModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    joinedWorkshops.assignAll([
      ProfileWorkshopModel(
        title: AppStrings.workshopTitle,
        time: AppStrings.demotime,
        workshopsTime: AppStrings.workshopTime,
      ),

      ProfileWorkshopModel(
        title: AppStrings.workshopTitle,
        time: AppStrings.demotime,
        workshopsTime: AppStrings.workshopTime,
      ),

      ProfileWorkshopModel(
        title: AppStrings.workshopTitle,
        time: AppStrings.demotime,
        workshopsTime: AppStrings.workshopTime,
      ),
    ]);
  }
}
