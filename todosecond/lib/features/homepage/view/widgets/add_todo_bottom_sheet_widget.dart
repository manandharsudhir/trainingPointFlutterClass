import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/homepage/model/todo_model.dart';
import 'package:todosecond/features/homepage/provider/todo_provider.dart';

class AddTodoBottomSheetWidget extends StatefulWidget {
  final TodoModel? todo;
  const AddTodoBottomSheetWidget({super.key, this.todo});

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
    titleController = TextEditingController(
      text: widget.todo?.title,
    );
    descController = TextEditingController(
      text: widget.todo?.description,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.todo == null ? "Add Todo" : "Update Todo",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0),
          child: Form(
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
        ),
        Consumer(builder: (context, ref, child) {
          return ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (widget.todo == null) {
                    ref.read(todoProvider.notifier).addTodo(TodoModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          title: titleController.text,
                          description: descController.text,
                        ));
                  } else {
                    ref.read(todoProvider.notifier).updateTodo(TodoModel(
                          id: widget.todo!.id,
                          title: titleController.text,
                          description: descController.text,
                          status: widget.todo!.status,
                        ));
                  }

                  Navigator.of(context).pop();
                }
              },
              child: Text(widget.todo == null ? "Add Todo" : "Update Todo"));
        })
      ],
    );
  }
}
