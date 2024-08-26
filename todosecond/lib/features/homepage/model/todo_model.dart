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

  TodoModel copyWith({
    String? title,
    String? description,
    TodoStatus? status,
  }) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      id: id,
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> data) {
    return TodoModel(
        id: data["_id"],
        title: data["title"],
        description: data["description"],
        status: (data["is_completed"] as bool)
            ? TodoStatus.completed
            : TodoStatus.incompleted);
  }
}

enum TodoStatus {
  completed,
  incompleted,
}
