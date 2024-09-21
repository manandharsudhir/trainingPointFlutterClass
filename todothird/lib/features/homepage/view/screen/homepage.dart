import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todothird/features/homepage/model/todo_model.dart';
import 'package:todothird/features/homepage/provider/todos_provider.dart';
import 'package:todothird/features/homepage/view/widget/add_todo_widget.dart';

import '../widget/todo_list.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   // List<TodoModel> todos = [
//   //   TodoModel(title: "title", id: 1),
//   //   TodoModel(title: "title 2", id: 2),
//   //   TodoModel(title: "title 3", id: 3),
//   //   TodoModel(title: "title 4", id: 4),
//   //   TodoModel(title: "title 5", id: 5, isCompleted: true),
//   //   TodoModel(title: "title 6", id: 6),
//   //   TodoModel(title: "title 7", id: 7),
//   //   TodoModel(title: "title 8", id: 8),
//   // ];

//   // void addTodo(TodoModel model) {
//   //   setState(() {
//   //     todos.add(model);
//   //   });
//   // }

//   // void changeStatus(int id) {
//   //   final index = todos.indexWhere((e) => e.id == id);
//   //   setState(() {
//   //     todos[index].isCompleted = !(todos[index].isCompleted);
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     print("Homepage");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Todo App"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//               context: context,
//               builder: (context) => AddTodoWidget(
//                     onAddTodo: (title, description) {
//                       addTodo(TodoModel(
//                         title: title,
//                         id: todos.length + 1,
//                         subtitle: description,
//                       ));
//                       Navigator.pop(context);
//                     },
//                   ));
//         },
//         child: Icon(Icons.add),
//       ),
//       body: DefaultTabController(
//         length: 3,
//         child: Column(
//           children: [
//             TabBar(
//               tabs: [
//                 Tab(
//                   text: "All",
//                 ),
//                 Tab(
//                   text: "Completed",
//                 ),
//                 Tab(
//                   text: "Incompleted",
//                 )
//               ],
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   TodoList(
//                     todos: todos,
//                     onChangeStatus: changeStatus,
//                   ),
//                   TodoList(
//                     todos: todos.where((e) => e.isCompleted).toList(),
//                     onChangeStatus: changeStatus,
//                   ),
//                   TodoList(
//                     todos: todos.where((e) => !e.isCompleted).toList(),
//                     onChangeStatus: changeStatus,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTodoWidget());
        },
        child: Icon(Icons.add),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Incompleted",
                )
              ],
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final todosState = ref.watch(todoProvider);
                  return todosState.when(data: (todos) {
                    return TabBarView(
                      children: [
                        TodoList(
                          todos: todos,
                        ),
                        TodoList(
                          todos: todos.where((e) => e.isCompleted).toList(),
                        ),
                        TodoList(
                          todos: todos.where((e) => !e.isCompleted).toList(),
                        ),
                      ],
                    );
                  }, error: (e, st) {
                    return Center(
                      child: Text(e.toString()),
                    );
                  }, loading: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
