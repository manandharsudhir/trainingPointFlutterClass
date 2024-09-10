import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todothird/features/homepage/model/todo_model.dart';
import 'package:todothird/features/homepage/provider/todos_provider.dart';

class TodoItemWidget extends ConsumerWidget {
  const TodoItemWidget({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(todoProvider.notifier).changeStatus(todo.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(todo.subtitle),
                ],
              ),
            ),
            Chip(
              label: Text(
                (todo.isCompleted) ? "Completed" : "Incompleted",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
