import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/homepage/model/todo_model.dart';

// final todoProvider = StateProvider<List<TodoModel>>((ref) {
//   return [];
// });

final todoProvider = StateNotifierProvider<TodoProvider, List<TodoModel>>(
    (ref) => TodoProvider());

class TodoProvider extends StateNotifier<List<TodoModel>> {
  TodoProvider() : super([]);

  void addTodo(TodoModel todo) {
    state = [...state, todo];
  }

  void updateTodo(TodoModel todo) {
    final index = state.indexWhere((e) => e.id == todo.id);
    state[index] = todo;
    state = [...state];
  }

  void toggleStatus(int id) {
    final index = state.indexWhere((e) => e.id == id);
    state[index] = TodoModel(
      id: state[index].id,
      title: state[index].title,
      description: state[index].description,
      status: state[index].status == TodoStatus.completed
          ? TodoStatus.incompleted
          : TodoStatus.completed,
    );
    state = [...state];
  }
}

// final todoProvider =
//     ChangeNotifierProvider<TodoProvider>((ref) => TodoProvider());

// class TodoProvider extends ChangeNotifier {
//   TodoProvider();

//   List<TodoModel> todos = [];
//   int counter=0;


  

//   void addTodo(TodoModel todo) {
//     todos = [...todos, todo];
//     notifyListeners();
//   }

//   void updateTodo(TodoModel todo) {
//     final index = state.indexWhere((e) => e.id == todo.id);
//     state[index] = todo;
//     state = [...state];
//   }

//   void toggleStatus(int id) {
//     final index = state.indexWhere((e) => e.id == id);
//     state[index] = TodoModel(
//       id: state[index].id,
//       title: state[index].title,
//       description: state[index].description,
//       status: state[index].status == TodoStatus.completed
//           ? TodoStatus.incompleted
//           : TodoStatus.completed,
//     );
//     state = [...state];
//   }
// }
