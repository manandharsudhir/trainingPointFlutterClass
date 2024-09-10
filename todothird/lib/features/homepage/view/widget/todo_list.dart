import 'package:flutter/material.dart';

import '../../model/todo_model.dart';
import 'todo_item_Widget.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todos,
  });

  final List<TodoModel> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => TodoItemWidget(
        todo: todos[index],
      ),
      // itemBuilder: (context, index) => ListTile(
      //   title: Text("title"),
      //   subtitle: Text("This is description"),

      // ),
      separatorBuilder: (context, index) => SizedBox(
        height: 8,
      ),
      itemCount: todos.length,
    );
  }
}
