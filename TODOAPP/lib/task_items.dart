import 'package:flutter/material.dart';

class TaskItems extends StatelessWidget {
  final String title;
  final String time;
  final List<String> participants;

  TaskItems({
    required this.title,
    required this.time,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: ListTile(
            title: Text(title),
            subtitle: Row(
              children: [
                Text(time),
                Spacer(),
                Row(
                  children: participants.map((participant) {
                    return CircleAvatar(
                      radius: 12,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        participant[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            trailing: Icon(Icons.more_vert)),
      ),
    );
  }
}
