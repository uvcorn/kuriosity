class ProfileWorkshopModel {
  final String id;
  final String title;
  final String time;
  final String? imageUrl;
  final String? workshopsTime;

  ProfileWorkshopModel({
    required this.id,
    required this.title,
    required this.time,
    this.imageUrl,
    this.workshopsTime,
  });
}
