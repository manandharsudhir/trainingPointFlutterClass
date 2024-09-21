import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todothird/features/homepage/model/todo_model.dart';
import 'package:todothird/features/homepage/provider/todos_provider.dart';

class EditTodoWidget extends StatefulWidget {
  EditTodoWidget({super.key, required this.todoModel});
  final TodoModel todoModel;

  @override
  State<EditTodoWidget> createState() => _EditTodoWidgetState();
}

class _EditTodoWidgetState extends State<EditTodoWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isCompleted = false;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    titleController = TextEditingController(
      text: widget.todoModel.title,
    );
    descriptionController = TextEditingController(
      text: widget.todoModel.subtitle,
    );
    setState(() {
      isCompleted = widget.todoModel.isCompleted;
    });
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text("Edit Todo"),
          TextFormField(
            controller: titleController,
            validator: (value) {
              if ((value ?? "").isEmpty) {
                return "Title is required";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Title",
            ),
          ),
          TextFormField(
            maxLines: null,
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: "Description",
            ),
          ),
          Row(
            children: [
              Text("Status"),
              Switch(
                  value: isCompleted,
                  onChanged: (value) {
                    setState(() {
                      isCompleted = value;
                    });
                  }),
            ],
          ),
          Consumer(builder: (context, ref, _) {
            return ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ref.read(todoProvider.notifier).edit(
                          todo: widget.todoModel.copyWith(
                        title: titleController.text,
                        subtitle: descriptionController.text,
                        isCompleted: isCompleted,
                      ));
                  Navigator.pop(context);
                }
              },
              child: Text("Edit"),
            );
          })
        ],
      ),
    );
  }
}
