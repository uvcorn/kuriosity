class Workshop {
  final String title;
  final String time;
  final String? imageUrl;
  final String? workshopsTime;

  Workshop({
    required this.title,
    required this.time,
    this.imageUrl,
    this.workshopsTime,
  });
}
