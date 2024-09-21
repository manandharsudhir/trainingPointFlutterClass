import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todothird/core/services/network_services.dart';
import 'package:todothird/features/homepage/model/todo_model.dart';
import 'package:todothird/features/homepage/repo/todo_repo.dart';

final todoProvider =
    StateNotifierProvider<TodosProvider, AsyncValue<List<TodoModel>>>(
        (ref) => TodosProvider());

final futureTodoProvider = FutureProvider((ref) async {
  final response = await TodoRepo.instance.getTodos();
  return response;
});

class TodosProvider extends StateNotifier<AsyncValue<List<TodoModel>>> {
  TodosProvider() : super(AsyncValue.loading()) {
    getTodos();
  }

  List<TodoModel> tempTodos = [];

  getTodos() async {
    try {
      final response = await TodoRepo.instance.getTodos();
      tempTodos = response;
      state = AsyncValue.data(response);
    } catch (e) {
      if (e is Exception) {
        state = AsyncError(e, StackTrace.current);
      }
      // state = AsyncValue.error(e.toString(), StackTrace.current);
    }
    // print(response.statusCode.toString());
  }

  Future add({required String title, String description = ""}) async {
    final newTodo = TodoModel(
      title: title,
      subtitle: description,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    state = AsyncValue.loading();
    try {
      final response = await TodoRepo.instance.addTodo(newTodo);

      state = AsyncValue.data([...tempTodos, response]);
    } catch (e, _) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future edit({required TodoModel todo}) async {
    state = AsyncValue.loading();
    try {
      await TodoRepo.instance.editTodo(todo);
      final index = tempTodos.indexWhere((e) => e.id == todo.id);
      tempTodos[index] = todo;
      state = AsyncValue.data([...tempTodos]);
    } catch (e, _) {
      state = AsyncValue.error(e, StackTrace.current);
    }
    // state = [...state, newTodo];
  }

  Future delete({required String id}) async {
    state = AsyncValue.loading();
    try {
      await TodoRepo.instance.deleteTodo(id);
      tempTodos.removeWhere((element) => element.id == id);
      state = AsyncValue.data([...tempTodos]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
