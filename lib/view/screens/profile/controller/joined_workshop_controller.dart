import 'package:get/get.dart';

import '../models/profile_workshop_model.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class JoinedWorkshopController extends GetxController {
  final RxList<ProfileWorkshopModel> joinedWorkshops =
      <ProfileWorkshopModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    joinedWorkshops.assignAll([
      ProfileWorkshopModel(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        workshopsTime: AppStrings.workshopTime,
      ),

      ProfileWorkshopModel(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        workshopsTime: AppStrings.workshopTime,
      ),

      ProfileWorkshopModel(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        workshopsTime: AppStrings.workshopTime,
      ),
    ]);
  }
}
