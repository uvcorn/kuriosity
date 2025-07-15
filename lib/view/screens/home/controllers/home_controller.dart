import 'package:get/get.dart';

class HomeController extends GetxController {
  var showSearchBar = false.obs;

  void toggleSearchBar(double offset) {
    if (offset > 50 && !showSearchBar.value) {
      showSearchBar.value = true;
    } else if (offset < 50 && showSearchBar.value) {
      showSearchBar.value = false;
    }
  }
}
