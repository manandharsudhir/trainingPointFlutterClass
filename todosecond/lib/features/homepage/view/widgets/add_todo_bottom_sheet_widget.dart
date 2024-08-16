import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todosecond/features/homepage/model/todo_model.dart';

class AddTodoBottomSheetWidget extends StatefulWidget {
  AddTodoBottomSheetWidget({super.key, required this.onPressed});

  final Function(TodoModel) onPressed;

  @override
  State<AddTodoBottomSheetWidget> createState() =>
      _AddTodoBottomSheetWidgetState();
}

class _AddTodoBottomSheetWidgetState extends State<AddTodoBottomSheetWidget> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController descController;

  @override
  void initState() {
    titleController = TextEditingController();
    descController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Add Todo"),
        const SizedBox(
          height: 16,
        ),
        Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "Title cannot be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Title",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: descController,
                  decoration: const InputDecoration(
                    hintText: "descrption",
                  ),
                ),
              ],
            )),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              widget.onPressed(TodoModel(
                id: DateTime.now().millisecondsSinceEpoch,
                title: titleController.text,
                description: descController.text,
              ));
            }
          },
          child: const Text("Add Todo"),
        )
      ],
    );
  }
}
