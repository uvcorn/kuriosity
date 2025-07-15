import 'package:get/get.dart';

import '../../../../data/models/workshop.dart';
import '../../../../utils/app_strings.dart/app_strings.dart';

class AttendedWorkshopController extends GetxController {
  final RxList<Workshop> attendedWorkshops = <Workshop>[].obs;
  @override
  void onInit() {
    super.onInit();
    attendedWorkshops.assignAll([
      Workshop(title: AppStrings.attendTitle, time: AppStrings.timeduration),

      Workshop(title: AppStrings.attendTitle, time: AppStrings.timeduration),

      Workshop(title: AppStrings.attendTitle, time: AppStrings.timeduration),
    ]);
  }
}
