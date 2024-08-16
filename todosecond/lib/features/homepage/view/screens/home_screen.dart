import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todosecond/features/homepage/view/widgets/add_todo_bottom_sheet_widget.dart';
import 'package:todosecond/features/homepage/view/widgets/all_todos_widget.dart';

import '../../model/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todos = [
    TodoModel(id: 1, title: "First Todo"),
    TodoModel(id: 2, title: "Second Todo"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTodoBottomSheetWidget(
                  onPressed: (TodoModel todo) {
                    setState(() {
                      todos.add(todo);
                    });
                    Navigator.pop(context);
                  },
                );
              });
        },
        label: const Text(
          "Add Todos",
        ),
      ),
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const TabBar(tabs: [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Incompleted",
                ),
              ]),
              Expanded(
                  child: TabBarView(children: [
                AllTodos(
                  allTodos: todos,
                  onPressed: (int todoId) {
                    setState(() {
                      final selectedTodo =
                          todos.firstWhere((e) => e.id == todoId);
                      if (selectedTodo.status == TodoStatus.completed) {
                        selectedTodo.status = TodoStatus.incompleted;
                      } else {
                        selectedTodo.status = TodoStatus.completed;
                      }
                      final index = todos.indexWhere((e) => e.id == todoId);
                      setState(() {
                        todos[index] = selectedTodo;
                      });
                    });
                  },
                ),
                Container(),
                Container(),
              ]))
            ],
          )),
    );
  }
}
