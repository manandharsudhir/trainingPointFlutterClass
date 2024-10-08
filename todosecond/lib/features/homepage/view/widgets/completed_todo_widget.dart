import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/homepage/provider/todo_provider.dart';

import '../../model/todo_model.dart';
import 'todo_item_widget.dart';

class CompletedTodoWidget extends ConsumerWidget {
  const CompletedTodoWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref
        .watch(todoProvider)
        .where((e) => e.status == TodoStatus.completed)
        .toList();
    return ListView.separated(
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemBuilder: (context, index) => TodoItemWidget(
        todo: todos[index],
      ),
      itemCount: todos.length,
    );
  }
}
