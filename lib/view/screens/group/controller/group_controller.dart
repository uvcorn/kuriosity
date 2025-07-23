// lib/controllers/group_controller.dart

import 'package:get/get.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../models/workshop_model.dart';

class GroupController extends GetxController {
  final _selectedTopCategoryIndex = 0.obs;
  int get selectedTopCategoryIndex => _selectedTopCategoryIndex.value;
  set selectedTopCategoryIndex(int value) =>
      _selectedTopCategoryIndex.value = value;

  final List<Map<String, dynamic>> topCategories = [
    {
      'selectedImageSrc': AppIcons.selectedallcate,
      'unselectedImageSrc': AppIcons.unselectedallcate,
      'label': 'All \nWorkshops',
    },
    {
      'selectedImageSrc': AppIcons.selectedshopcate,
      'unselectedImageSrc': AppIcons.unselectedshopcate,
      'label': 'Shopping & \nBrands',
    },
    {
      'selectedImageSrc': AppIcons.selectedfoodcate,
      'unselectedImageSrc': AppIcons.unselectedfoodcate,
      'label': 'Food & \nDiet',
    },
    {
      'selectedImageSrc': AppIcons.selectedtreecate,
      'unselectedImageSrc': AppIcons.unselectedtreecate,
      'label': 'Home \nFarming',
    },
    {
      'selectedImageSrc': AppIcons.selecteddrivingcate,
      'unselectedImageSrc': AppIcons.unselecteddrivingcate,
      'label': 'Driving & \nCommuting',
    },
  ];

  final List<WorkshopModel> _allWorkshops = [
    WorkshopModel(
      title: AppStrings.workshopTitle,
      instructorName: AppStrings.userName,
      date: AppStrings.time,
      tags: ["4 week workshops"],
      participants: 7,
      spacesLeft: 3,
      profileImageUrl: AppConstants.profileImage,
      profileImage2Url: AppConstants.profile2Image,
      fullImageUrls: [AppConstants.flowerbutterfly, AppConstants.vegatable],
      category: WorkshopCategory.foodAndDiet,
      isCurrentlyProgressing: true,
    ),
    WorkshopModel(
      title: AppStrings.workshopTitle,
      instructorName: AppStrings.userName,
      date: AppStrings.time,
      tags: ["Single workshop"],
      participants: 7,
      spacesLeft: 3,
      profileImageUrl: AppConstants.profileImage,
      profileImage2Url: AppConstants.profile2Image,
      fullImageUrls: [AppConstants.flowerbutterfly, AppConstants.vegatable],
      category: WorkshopCategory.drivingAndCommuting,
      isUpcoming: true,
    ),
    WorkshopModel(
      title: AppStrings.workshopTitle,
      instructorName: AppStrings.userName,
      date: AppStrings.time,
      tags: ["Single workshop"],
      participants: 4,
      spacesLeft: 0,
      profileImageUrl: AppConstants.profileImage,
      profileImage2Url: AppConstants.profile2Image,
      fullImageUrls: [AppConstants.flowerbutterfly, AppConstants.vegatable],
      // isFinished: true,
      category: WorkshopCategory.foodAndDiet,
      isHostedByUser: false,
      isUpcoming: true,
    ),
    WorkshopModel(
      title: AppStrings.workshopTitle,
      instructorName: AppStrings.userName,
      date: AppStrings.time,
      tags: ["Online workshop"],
      participants: 12,
      spacesLeft: 8,
      profileImageUrl: AppConstants.profileImage,
      profileImage2Url: AppConstants.profile2Image,
      category: WorkshopCategory.shoppingAndBrands,
      fullImageUrls: [AppConstants.flowerbutterfly, AppConstants.vegatable],
      isCurrentlyProgressing: true,
    ),
    WorkshopModel(
      title: AppStrings.workshopTitle,
      instructorName: AppStrings.userName,
      date: AppStrings.time,
      tags: ["Online workshop"],
      participants: 12,
      spacesLeft: 8,
      profileImageUrl: AppConstants.profileImage,
      profileImage2Url: AppConstants.profile2Image,
      category: WorkshopCategory.shoppingAndBrands,
      fullImageUrls: [AppConstants.flowerbutterfly, AppConstants.vegatable],
      isUpcoming: true,
    ),
    WorkshopModel(
      title: AppStrings.workshopTitle,
      instructorName: AppStrings.userName,
      date: AppStrings.time,
      tags: ["Online workshop"],
      participants: 12,
      spacesLeft: 8,
      profileImageUrl: AppConstants.profileImage,
      profileImage2Url: AppConstants.profile2Image,
      category: WorkshopCategory.shoppingAndBrands,
      fullImageUrls: [AppConstants.flowerbutterfly, AppConstants.vegatable],
      isUpcoming: true,
    ),
    WorkshopModel(
      title: AppStrings.workshopTitle,
      instructorName: AppStrings.userName,
      date: AppStrings.time,
      tags: ["Practical workshop"],
      participants: 8,
      spacesLeft: 2,
      profileImageUrl: AppConstants.profileImage,
      profileImage2Url: AppConstants.profile2Image,
      category: WorkshopCategory.homeFarming,
      fullImageUrls: [AppConstants.flowerbutterfly, AppConstants.vegatable],
    ),
    WorkshopModel(
      title: AppStrings.workshopTitle,
      instructorName: AppStrings.userName,
      date: AppStrings.time,
      tags: ["Advanced workshop"],
      participants: 5,
      spacesLeft: 0,
      profileImageUrl: AppConstants.profileImage,
      profileImage2Url: AppConstants.profile2Image,
      isFinished: true,
      category: WorkshopCategory.homeFarming,
      fullImageUrls: [AppConstants.flowerbutterfly, AppConstants.vegatable],
    ),
    WorkshopModel(
      title: AppStrings.workshopTitle,
      instructorName: AppStrings.userName,
      date: AppStrings.time,
      tags: ["Online seminar"],
      participants: 20,
      spacesLeft: 10,
      isHostedByUser: true,
      profileImageUrl: AppConstants.profileImage,
      profileImage2Url: AppConstants.profile2Image,
      category: WorkshopCategory.drivingAndCommuting,
      fullImageUrls: [AppConstants.flowerbutterfly],
    ),
  ];

  RxList<WorkshopModel> get filteredWorkshops => _allWorkshops
      .where((workshop) {
        if (selectedTopCategoryIndex == 0) {
          return true;
        }
        WorkshopCategory category;
        switch (selectedTopCategoryIndex) {
          case 1:
            category = WorkshopCategory.shoppingAndBrands;
            break;
          case 2:
            category = WorkshopCategory.foodAndDiet;
            break;
          case 3:
            category = WorkshopCategory.homeFarming;
            break;
          case 4:
            category = WorkshopCategory.drivingAndCommuting;
            break;
          default:
            category = WorkshopCategory.all;
        }
        return workshop.category == category;
      })
      .toList()
      .obs;
  RxList<WorkshopModel> get currentlyProgressingWorkshops => _allWorkshops
      .where((workshop) => workshop.isCurrentlyProgressing == true)
      .toList()
      .obs;
  RxList<WorkshopModel> get upcomingWorkshops => _allWorkshops
      .where((workshop) => workshop.isUpcoming == true)
      .toList()
      .obs;
  RxList<WorkshopModel> get hostedWorkshops => _allWorkshops
      .where((workshop) => workshop.isHostedByUser == true)
      .toList()
      .obs;
}
