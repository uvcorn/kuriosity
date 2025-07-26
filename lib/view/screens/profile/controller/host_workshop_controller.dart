import 'package:get/get.dart';

import '../../../../utils/app_strings/app_strings.dart';
import '../models/profile_workshop_model.dart';

class HostWorkshopController extends GetxController {
  final RxList<ProfileWorkshopModel> hostWorkshops =
      <ProfileWorkshopModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    hostWorkshops.assignAll([
      ProfileWorkshopModel(
        title: AppStrings.workshopTitle,
        time: AppStrings.demotime,
        workshopsTime: AppStrings.workshopTime,
      ),
    ]);
  }
}
