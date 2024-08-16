class TodoModel {
  final String title;
  final String description;
  TodoStatus status;
  final int id;

  TodoModel({
    required this.id,
    required this.title,
    this.description = "",
    this.status = TodoStatus.incompleted,
  });
}

enum TodoStatus {
  completed,
  incompleted,
}
