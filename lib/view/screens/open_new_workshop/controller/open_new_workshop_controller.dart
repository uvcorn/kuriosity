import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../course_model/open_workshop_model.dart';

class OpenWorkshopController extends GetxController {
  final TextEditingController workshopTitleController = TextEditingController();
  final TextEditingController oneLineExplanationController =
      TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController targetedPeopleController =
      TextEditingController();
  final TextEditingController groupCapacityController = TextEditingController();
  final TextEditingController courseMaterialController =
      TextEditingController();
  final TextEditingController introduceYourselfController =
      TextEditingController();

  final RxList<OpenWorkshopModel> courses = <OpenWorkshopModel>[].obs;
  final RxSet<String> selectedExpertise = <String>{}.obs;

  void addCourse(OpenWorkshopModel course) {
    courses.add(course);
  }

  void editCourse(int index, OpenWorkshopModel course) {
    courses[index] = course;
  }

  void deleteCourse(int index) {
    courses.removeAt(index);
  }

  void toggleExpertise(String value) {
    if (selectedExpertise.contains(value)) {
      selectedExpertise.remove(value);
    } else {
      selectedExpertise.add(value);
    }
  }

  void submitForm() {
    // Implement your form submission logic here
    // You can access all controller values and the courses list
    debugPrint('Workshop Title: ${workshopTitleController.text}');
    debugPrint('One Line Explanation: ${oneLineExplanationController.text}');
    debugPrint('Description: ${descriptionController.text}');
    debugPrint('Targeted People: ${targetedPeopleController.text}');
    debugPrint('Group Capacity: ${groupCapacityController.text}');
    debugPrint('Course Material: ${courseMaterialController.text}');
    debugPrint('Introduce Yourself: ${introduceYourselfController.text}');
    debugPrint('Courses: ${courses.length}');
    debugPrint('Selected Expertise: $selectedExpertise');

    Get.snackbar(
      'Form Submitted',
      'Workshop details logged to console!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    workshopTitleController.dispose();
    oneLineExplanationController.dispose();
    descriptionController.dispose();
    targetedPeopleController.dispose();
    groupCapacityController.dispose();
    courseMaterialController.dispose();
    introduceYourselfController.dispose();
    super.onClose();
  }
}
