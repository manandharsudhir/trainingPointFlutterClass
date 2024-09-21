import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todothird/features/homepage/model/todo_model.dart';
import 'package:todothird/features/homepage/provider/todos_provider.dart';
import 'package:todothird/features/homepage/view/widget/edit_todo_widget.dart';

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
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (_) {
              ref.read(todoProvider.notifier).delete(id: todo.id);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (_) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return EditTodoWidget(todoModel: todo);
                  });
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          // ref.read(todoProvider.notifier).changeStatus(todo.id);
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
