import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.model,
  });
  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff6f3fa),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  model.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  model.description,
                ),
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
