enum WorkshopCategory {
  all,
  shoppingAndBrands,
  foodAndDiet,
  homeFarming,
  drivingAndCommuting,
}

class WorkshopModel {
  final String title;
  final String instructorName;
  final String date;
  final List<String> tags;
  final int participants;
  final int spacesLeft;
  final String profileImageUrl;
  final String profileImage2Url;
  final List<String>? fullImageUrls;
  final bool isFinished;
  final WorkshopCategory category;
  final bool isCurrentlyProgressing;
  final bool isUpcoming;
  final bool isHostedByUser;
  final bool isSaved;

  const WorkshopModel({
    required this.title,
    required this.instructorName,
    required this.date,
    required this.tags,
    required this.participants,
    required this.spacesLeft,
    required this.profileImageUrl,
    this.fullImageUrls,
    required this.profileImage2Url,
    this.isFinished = false,
    required this.category,
    this.isCurrentlyProgressing = false,
    this.isUpcoming = false,
    this.isHostedByUser = false,
    this.isSaved = false,
  });
}
