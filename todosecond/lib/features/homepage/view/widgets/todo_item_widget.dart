import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todosecond/features/homepage/provider/todo_provider.dart';
import 'package:todosecond/features/homepage/view/widgets/add_todo_bottom_sheet_widget.dart';

import '../../model/todo_model.dart';

class TodoItemWidget extends ConsumerWidget {
  const TodoItemWidget({
    super.key,
    required this.todo,
  });

  final TodoModel todo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: ValueKey(todo.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              ref.read(todoProvider.notifier).deleteTodo(todo.id.toString());
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return AddTodoBottomSheetWidget(
                      todo: todo); // Pass the current todo
                },
              );
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit, // Use edit icon for update
            label: 'Update',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          ref.read(todoProvider.notifier).toggleStatus(todo.id.toString());
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(todo.description),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(todo.status.name),
              )
            ],
          ),
        ),
      ),
    );
  }
}
