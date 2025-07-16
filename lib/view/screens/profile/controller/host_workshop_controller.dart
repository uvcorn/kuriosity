import 'package:get/get.dart';

import '../models/profile_workshop_model.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class HostWorkshopController extends GetxController {
  final RxList<ProfileWorkshopModel> hostWorkshops =
      <ProfileWorkshopModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    hostWorkshops.assignAll([
      ProfileWorkshopModel(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        workshopsTime: AppStrings.workshopTime,
      ),
    ]);
  }
}
