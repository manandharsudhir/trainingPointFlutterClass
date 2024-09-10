import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/homepage/model/todo_model.dart';

class TestHomepage extends StatefulWidget {
  const TestHomepage({super.key});

  @override
  State<TestHomepage> createState() => _TestHomepageState();
}

class _TestHomepageState extends State<TestHomepage> {
  List<TodoModel> listOfTodos = [
    TodoModel(
      id: "1",
      title: "Incompleted",
      status: TodoStatus.incompleted,
    ),
    TodoModel(id: "2", title: "Completed", status: TodoStatus.completed)
  ];

  addTodo() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            listOfTodos.add(TodoModel(id: "3", title: "NewTodo"));
          });
        }),
        body: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(tabs: [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Incompleted",
                  ),
                  Tab(
                    text: "Completed",
                  ),
                ]),
                Expanded(
                    child: TabBarView(children: [
                  TodosListWidget(
                    todos: listOfTodos,
                  ),
                  TodosListWidget(
                    todos: listOfTodos
                        .where((e) => e.status == TodoStatus.incompleted)
                        .toList(),
                  ),
                  TodosListWidget(
                    todos: listOfTodos
                        .where((e) => e.status == TodoStatus.completed)
                        .toList(),
                  ),
                ])),
              ],
            ),
          ),
        ));
  }
}

class TodosListWidget extends StatelessWidget {
  const TodosListWidget({super.key, required this.todos});

  final List<TodoModel> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Text(todos[index].title),
      separatorBuilder: (context, index) => SizedBox(
        height: 16,
      ),
      itemCount: todos.length,
    );
  }
}
