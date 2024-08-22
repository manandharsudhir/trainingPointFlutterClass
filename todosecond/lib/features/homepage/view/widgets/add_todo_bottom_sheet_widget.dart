import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/homepage/model/todo_model.dart';
import 'package:todosecond/features/homepage/provider/todo_provider.dart';

class AddTodoBottomSheetWidget extends StatefulWidget {
  AddTodoBottomSheetWidget({
    super.key,
  });

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
        Consumer(builder: (context, ref, child) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ref.read(todoProvider.notifier).update((value) {
                  value.add(TodoModel(
                    id: DateTime.now().millisecondsSinceEpoch,
                    title: titleController.text,
                    description: descController.text,
                  ));
                  return [...value];
                });
              }
            },
            child: const Text("Add Todo"),
          );
        })
      ],
    );
  }
}
