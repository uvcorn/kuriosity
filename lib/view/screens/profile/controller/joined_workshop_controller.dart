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
        id: '1',
        title: AppStrings.workshopTitle,
        time: AppStrings.demotime,
        workshopsTime: AppStrings.workshopTime,
      ),

      ProfileWorkshopModel(
        id: '2',
        title: AppStrings.workshopTitle,
        time: AppStrings.demotime,
        workshopsTime: AppStrings.workshopTime,
      ),

      ProfileWorkshopModel(
        id: '3',
        title: AppStrings.workshopTitle,
        time: AppStrings.demotime,
        workshopsTime: AppStrings.workshopTime,
      ),
    ]);
  }
}
