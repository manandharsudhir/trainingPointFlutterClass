class TaskModel {
  int id;
  String title;
  String description;
  TaskStaus status;

  TaskModel({
    required this.id,
    required this.title,
    this.description = "",
    this.status = TaskStaus.nodone,
  });
}

enum TaskStaus {
  nodone,
  progressing,
  completed,
}
