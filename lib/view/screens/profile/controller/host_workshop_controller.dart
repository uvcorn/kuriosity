import 'package:get/get.dart';

import '../../../../data/models/workshop.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class HostWorkshopController extends GetxController {
  final RxList<Workshop> hostWorkshops = <Workshop>[].obs;
  @override
  void onInit() {
    super.onInit();
    hostWorkshops.assignAll([
      Workshop(
        title: AppStrings.workshopTitle,
        time: AppStrings.time,
        workshopsTime: AppStrings.workshopTime,
      ),
    ]);
  }
}
