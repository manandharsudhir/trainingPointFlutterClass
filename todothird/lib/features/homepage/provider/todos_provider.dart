import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todothird/features/homepage/model/todo_model.dart';

final todoProvider = StateNotifierProvider<TodosProvider, List<TodoModel>>(
    (ref) => TodosProvider());

class TodosProvider extends StateNotifier<List<TodoModel>> {
  TodosProvider()
      : super([
          TodoModel(title: "title", id: 1),
          TodoModel(title: "title 2", id: 2),
          TodoModel(title: "title 3", id: 3),
          TodoModel(title: "title 4", id: 4),
          TodoModel(title: "title 5", id: 5, isCompleted: true),
          TodoModel(title: "title 6", id: 6),
          TodoModel(title: "title 7", id: 7),
          TodoModel(title: "title 8", id: 8),
        ]);

  void add({required String title, String description = ""}) {
    final newTodo = TodoModel(
      title: title,
      subtitle: description,
      id: state.length + 1,
    );
    state = [...state, newTodo];
  }

  void changeStatus(int id) {
    final index = state.indexWhere((e) => e.id == id);
    state[index].isCompleted = !(state[index].isCompleted);
    state = [...state];
  }
}
