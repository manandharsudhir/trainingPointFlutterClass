import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/homepage/model/todo_model.dart';

final todoProvider = StateProvider<List<TodoModel>>((ref) {
  return [];
});
