import 'package:image_picker/image_picker.dart';

class Message {
  final String? text;
  final DateTime time;
  final bool isMe;
  final XFile? image;

  Message({this.text, required this.time, required this.isMe, this.image});
}
