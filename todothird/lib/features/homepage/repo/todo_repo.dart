import 'package:todothird/core/services/network_services.dart';
import 'package:todothird/features/homepage/model/todo_model.dart';

class TodoRepo {
  TodoRepo._();

  static final TodoRepo instance = TodoRepo._();

  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await NetworkServices.instance
          .get("todos", queryParameters: {"limit": 10});
      return (response["items"] as List)
          .map((e) => TodoModel.fromJson(e))
          .toList();
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  Future<TodoModel> addTodo(TodoModel model) async {
    try {
      final reponse = await NetworkServices.instance.post(
        "todos",
        data: model.toJson(),
      );
      return TodoModel.fromJson(reponse["data"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<TodoModel> editTodo(TodoModel model) async {
    try {
      final reponse = await NetworkServices.instance.put(
        "todos/${model.id}",
        data: model.toJson(),
      );
      return TodoModel.fromJson(reponse["data"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<TodoModel> deleteTodo(String id) async {
    try {
      final reponse = await NetworkServices.instance.delete(
        "todos/$id",
      );
      return TodoModel.fromJson(reponse["data"]);
    } catch (e) {
      rethrow;
    }
  }
}
