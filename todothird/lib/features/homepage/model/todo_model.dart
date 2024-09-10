class TodoModel {
  String title;
  String subtitle;
  bool isCompleted;
  int id;

  TodoModel({
    required this.title,
    this.isCompleted = false,
    this.subtitle = "",
    required this.id,
  });
}
