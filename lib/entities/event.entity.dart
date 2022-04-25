
class Event {

  String id;
  String title;
  String description;

  DateTime createdAt = DateTime.now();
  DateTime startAt;
  DateTime endAt;

  Event(this.id, this.title, this.description, this.startAt, this.endAt);
}