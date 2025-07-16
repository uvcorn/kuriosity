enum WorkshopCategory {
  all,
  shoppingAndBrands,
  foodAndDiet,
  homeFarming,
  drivingAndCommuting,
}

class Workshop {
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

  const Workshop({
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
  });
}
