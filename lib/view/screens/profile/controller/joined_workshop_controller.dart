import 'package:get/get.dart';

import '../../../../data/models/workshop.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class JoinedWorkshopController extends GetxController {
  final RxList<Workshop> joinedWorkshops = <Workshop>[].obs;
  @override
  void onInit() {
    super.onInit();
    joinedWorkshops.assignAll([
      Workshop(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        workshopsTime: AppStrings.workshopTime,
      ),

      Workshop(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        workshopsTime: AppStrings.workshopTime,
      ),

      Workshop(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        workshopsTime: AppStrings.workshopTime,
      ),
    ]);
  }
}
