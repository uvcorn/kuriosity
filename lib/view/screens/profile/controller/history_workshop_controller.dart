import 'package:get/get.dart';

import '../../../../utils/app_strings/app_strings.dart';
import '../models/profile_workshop_model.dart';
import '../../../../utils/app_const/app_const.dart';

class HistoryWorkshopController extends GetxController {
  final RxList<ProfileWorkshopModel> historyWorkshops =
      <ProfileWorkshopModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    historyWorkshops.assignAll([
      ProfileWorkshopModel(
        id: '1',
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        imageUrl: AppConstants.flowerbutterfly,
      ),

      ProfileWorkshopModel(
        id: '2',
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        imageUrl: AppConstants.flowerbutterfly,
      ),

      ProfileWorkshopModel(
        id: '3',
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        imageUrl: AppConstants.flowerbutterfly,
      ),
    ]);
  }
}
