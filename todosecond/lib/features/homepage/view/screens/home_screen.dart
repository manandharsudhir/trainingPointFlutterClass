import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/homepage/view/widgets/add_todo_bottom_sheet_widget.dart';
import 'package:todosecond/features/homepage/view/widgets/all_todos_widget%20copy.dart';
import 'package:todosecond/features/homepage/view/widgets/completed_todo_widget.dart';
import 'package:todosecond/features/homepage/view/widgets/incompleted_todos_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTodoBottomSheetWidget();
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
                AllTodos(),
                CompletedTodoWidget(),
                IncompletedTodosWidget(),
              ]))
            ],
          )),
    );
  }
}
