import 'package:dio/dio.dart';
import 'package:todosecond/core/services/base_client.dart';
import 'package:todosecond/features/homepage/model/todo_model.dart';

class TodoServices {
  Future<List<TodoModel>> getTodo() async {
    try {
      final response = await BaseClient.instance.get("/todos");
      final todos = (response["items"] as List)
          .map((e) => TodoModel.fromJson(e))
          .toList();

      return todos;
    } catch (e) {
      rethrow;
    }
  }
}
