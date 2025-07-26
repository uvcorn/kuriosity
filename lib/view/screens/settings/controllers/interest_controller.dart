// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';

import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class InterestController extends GetxController {
  final int maxSelection = 5;
  var selectedInterests = <String>[].obs;

  final List<String> allInterests = [
    'Fashion',
    'Upcycling',
    'Dining Out',
    'Yoga',
    'Vegan',
    'Plant',
    'Clean Energy',
    'Cooking',
    'Gardening',
    'Micro-plastic',
    'Slow Fashion',
    'Second hand',
    'Furniture',
    'Economy',
    'Storytelling',
    'Book',
    'Electric Car',
    'House Farming',
    'Cycling',
    'Shopping',
    'Sustainable brand',
    'Renewable material',
  ];

  InterestController(List<String> initialSelected) {
    selectedInterests.assignAll(initialSelected);
  }

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      if (selectedInterests.length < maxSelection) {
        selectedInterests.add(interest);
      } else {
        SnackbarHelper.show(
          message:
              "$AppStrings.youCanSelectMaximum $maxSelection $AppStrings.interests.",
          isSuccess: false,
        );
      }
    }
  }
}
