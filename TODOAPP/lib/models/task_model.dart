class TaskModel {
  int id;
  String title;
  String description;
  bool status;

  TaskModel({
    required this.id,
    required this.title,
    this.description = "",
    this.status = false,
  });
}
