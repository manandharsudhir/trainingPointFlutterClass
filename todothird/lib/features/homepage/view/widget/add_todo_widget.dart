import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todothird/features/homepage/model/todo_model.dart';
import 'package:todothird/features/homepage/provider/todos_provider.dart';

class AddTodoWidget extends StatelessWidget {
  AddTodoWidget({
    super.key,
  });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text("Add Todo"),
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
          Consumer(builder: (context, ref, _) {
            return ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ref.read(todoProvider.notifier).add(
                        title: titleController.text,
                        description: descriptionController.text,
                      );
                  Navigator.pop(context);
                }
              },
              child: Text("Add"),
            );
          })
        ],
      ),
    );
  }
}
