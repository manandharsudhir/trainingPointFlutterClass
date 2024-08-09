import 'package:flutter/material.dart';
import 'package:to_do_app/task_items.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskItems(
          title: 'Project daily stand-up',
          time: '9:00 AM',
          participants: ['Joy', 'Bene', 'ling'],
        ),
        TaskItems(
          title: 'Internal New UI- Style',
          time: '12:00 PM',
          participants: ['Ixia', 'Lance'],
        ),
        TaskItems(
          title: 'Weekly Review',
          time: '2 PM',
          participants: ['Vexana', 'Odette'],
        ),
        TaskItems(
          title: 'Interview',
          time: '4 PM',
          participants: ['Gusion'],
        ),
        TaskItems(
          title: 'Project daily stand-up',
          time: '9:00 AM',
          participants: ['Joy', 'Bene', 'ling'],
        ),
        TaskItems(
          title: 'Internal New UI- Style',
          time: '12:00 PM',
          participants: ['Ixia', 'Lance'],
        ),
        TaskItems(
          title: 'Weekly Review',
          time: '2 PM',
          participants: ['Vexana', 'Odette'],
        ),
        TaskItems(
          title: 'Interview',
          time: '4 PM',
          participants: ['Gusion'],
        ),
      ],
    );
  }
}
