import 'package:uuid/uuid.dart';

class Event {

  late String id;
  String title;
  String description;

  DateTime createdAt = DateTime.now();
  DateTime startAt;
  DateTime endAt;

  Event(this.title, this.description, this.startAt, this.endAt) {
    id = const Uuid().v4();
  }
}