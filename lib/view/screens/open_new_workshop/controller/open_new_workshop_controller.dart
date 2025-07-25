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

  void reset() {
    workshopTitleController.clear();
    oneLineExplanationController.clear();
    descriptionController.clear();
    targetedPeopleController.clear();
    groupCapacityController.clear();
    introduceYourselfController.clear();
    courses.clear();
    selectedExpertise.clear();
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

  @override
  void onClose() {
    workshopTitleController.dispose();
    oneLineExplanationController.dispose();
    descriptionController.dispose();
    targetedPeopleController.dispose();
    groupCapacityController.dispose();
    introduceYourselfController.dispose();
    super.onClose();
  }
}
