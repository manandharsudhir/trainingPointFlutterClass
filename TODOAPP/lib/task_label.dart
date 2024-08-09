import 'package:flutter/material.dart';

class TaskLabel extends StatelessWidget {
  final String label;
  final Color color;

  TaskLabel({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: color,
      labelStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
