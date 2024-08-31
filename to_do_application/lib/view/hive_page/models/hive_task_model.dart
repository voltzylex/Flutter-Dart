// lib/models/task.dart
class Task {
  final int? id;
  final String title;
  final String description;

  Task({this.id, required this.title, required this.description});

  // Convert a Task into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  // Extract a Task object from a Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}
