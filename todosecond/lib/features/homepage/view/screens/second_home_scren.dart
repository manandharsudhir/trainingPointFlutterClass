import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/homepage/view/widgets/add_todo_bottom_sheet_widget.dart';
import 'package:todosecond/features/homepage/view/widgets/all_todos_widget%20copy.dart';
import 'package:todosecond/features/homepage/view/widgets/completed_todo_widget.dart';
import 'package:todosecond/features/homepage/view/widgets/incompleted_todos_widget.dart';

class SecondHomeScreen extends ConsumerStatefulWidget {
  const SecondHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SecondHomeScreenState();
}

class _SecondHomeScreenState extends ConsumerState<SecondHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _tabController.animateTo(
            2,
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Incompled",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: Center(
                      child: Text("All"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("Completed"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("Incompleted"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SecondHomeScreen extends ConsumerWidget {
//   const SecondHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
    
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {},
//       //   child: Icon(Icons.add),
//       // ),
//       // body: SafeArea(
//       //   child: DefaultTabController(
//       //     length: 3,
//       //     child: Column(
//       //       children: [
//       //         TabBar(
//       //           tabs: [
//       //             Tab(
//       //               text: "All",
//       //             ),
//       //             Tab(
//       //               text: "Completed",
//       //             ),
//       //             Tab(
//       //               text: "Incompled",
//       //             ),
//       //           ],
//       //         ),
//       //         Expanded(
//       //           child: TabBarView(
//       //             children: [
//       //               Container(
//       //                 child: Center(
//       //                   child: Text("All"),
//       //                 ),
//       //               ),
//       //               Container(
//       //                 child: Center(
//       //                   child: Text("Completed"),
//       //                 ),
//       //               ),
//       //               Container(
//       //                 child: Center(
//       //                   child: Text("Incompleted"),
//       //                 ),
//       //               ),
//       //             ],
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // ),
    
//     );
//   }
// }
