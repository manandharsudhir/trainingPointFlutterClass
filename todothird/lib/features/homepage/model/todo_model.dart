import 'package:flutter/foundation.dart';

class TodoModel {
  String title;
  String subtitle;
  bool isCompleted;
  String id;

  TodoModel({
    required this.title,
    this.isCompleted = false,
    this.subtitle = "",
    required this.id,
  });

// {"_id":"66cc2f095b436b24f02d0c93",
// "title":"test",
// "description":"test",
// "is_completed":false,
// "created_at":"2024-08-26T07:30:17.768Z",
// "updated_at":"2024-08-26T07:30:17.768Z"
// }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["_id"],
      title: json["title"],
      isCompleted: json["is_completed"],
      subtitle: json["description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": subtitle,
      "is_completed": isCompleted,
    };
  }

  TodoModel copyWith({
    String? title,
    String? subtitle,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      subtitle: subtitle ?? this.subtitle,
    );
  }
}
