import 'package:get/get.dart';

import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class AuthController extends GetxController {
  final RxBool _isPremiumUser = false.obs;
  final RxBool _isRegister = false.obs;

  bool get isPremiumUser => _isPremiumUser.value;
  RxBool get isRegister => _isRegister;

  void register() {
    _isRegister.value = true;
  }

  void cancelRegister() {
    _isRegister.value = false;
  }

  void upgradeToPremium() {
    _isPremiumUser.value = true;
    SnackbarHelper.show(
      message: AppStrings.youAreAPremiumUser,
      isSuccess: true,
    );
  }
}
