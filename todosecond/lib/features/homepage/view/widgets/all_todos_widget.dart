import 'package:flutter/material.dart';

import '../../model/todo_model.dart';
import 'todo_item_widget.dart';

class AllTodos extends StatelessWidget {
  const AllTodos({
    super.key,
    required this.allTodos,
    required this.onPressed,
  });
  final List<TodoModel> allTodos;
  final Function(int) onPressed;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemBuilder: (context, index) => TodoItemWidget(
        todo: allTodos[index],
        onPressed: (int id) {
          onPressed(id);
        },
      ),
      itemCount: allTodos.length,
    );
  }
}
