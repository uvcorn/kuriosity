import 'package:get/get.dart';

import '../../../../data/models/workshop.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class HistoryWorkshopController extends GetxController {
  final RxList<Workshop> historyWorkshops = <Workshop>[].obs;
  @override
  void onInit() {
    super.onInit();
    historyWorkshops.assignAll([
      Workshop(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        imageUrl: AppConstants.flowerbutterfly,
      ),

      Workshop(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        imageUrl: AppConstants.flowerbutterfly,
      ),

      Workshop(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        imageUrl: AppConstants.flowerbutterfly,
      ),
    ]);
  }
}
