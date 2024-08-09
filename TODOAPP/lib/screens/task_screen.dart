// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../task_label.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextField(
              enabled: true,
              decoration: InputDecoration(
                hintText: 'WHAT DO YOU NEED TODAY',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 30),
          Wrap(
            spacing: 8.0,
            children: [
              TaskLabel(label: 'Meeting', color: Colors.green),
              TaskLabel(label: 'Review', color: Colors.yellow),
              TaskLabel(label: 'Marketing', color: Colors.pink),
              TaskLabel(label: 'Design project', color: Colors.blue),
              TaskLabel(label: '+', color: Colors.grey),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 340,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
