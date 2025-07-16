class ProfileWorkshopModel {
  final String title;
  final String time;
  final String? imageUrl;
  final String? workshopsTime;

  ProfileWorkshopModel({
    required this.title,
    required this.time,
    this.imageUrl,
    this.workshopsTime,
  });
}
