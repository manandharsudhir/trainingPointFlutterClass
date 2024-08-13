// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/screens/task_list.dart';
import 'package:to_do_app/screens/task_screen.dart';
import 'package:to_do_app/widgets/task_item.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  List<TaskModel> taskLists = [
    TaskModel(id: 1, title: "First"),
    TaskModel(id: 2, title: "Second"),
    TaskModel(id: 3, title: "Third"),
  ];

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     backgroundColor: Colors.white,
    //     appBar: AppBar(
    //       centerTitle: false,
    //       title: Text(
    //         'Today',
    //         style: TextStyle(
    //           fontSize: 36,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       actions: [
    //         IconButton(
    //           onPressed: () {
    //             //need to specify the calender actions.
    //           },
    //           icon: Icon(
    //             Icons.calendar_today,
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         ),
    //       ],
    //       bottom: PreferredSize(
    //         preferredSize: Size.fromHeight(200),
    //         child: Column(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(17.0),
    //               child: Text('18 Jun2024, Tuesday',
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.w600,
    //                     color: Theme.of(context).primaryColor,
    //                   )),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(17.0),
    //               child: TextField(
    //                 textAlign: TextAlign.center,
    //                 decoration: InputDecoration(
    //                   hintText: 'Search',
    //                   hintStyle: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.white,
    //                   ),
    //                   prefixIcon: Icon(
    //                     Icons.search_rounded,
    //                     color: Colors.white,
    //                   ),
    //                   border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(25),
    //                   ),
    //                   fillColor: Theme.of(context).primaryColor,
    //                   filled: true,
    //                 ),
    //               ),
    //             ),
    //             TabBar(
    //               tabs: [
    //                 Tab(text: "Undone"),
    //                 Tab(text: "Meetings"),
    //                 Tab(text: "Consumption"),
    //               ],
    //               labelColor: Theme.of(context).primaryColor,
    //               unselectedLabelColor: Colors.grey,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         TaskListView(),
    //       ],
    //     ),
    //     floatingActionButton: SizedBox(
    //       width: 400,
    //       height: 70,
    //       child: FloatingActionButton(
    //         backgroundColor: Theme.of(context).primaryColor,
    //         onPressed: () {
    //           showModalBottomSheet(
    //               isScrollControlled: true,
    //               backgroundColor: Theme.of(context).primaryColor,
    //               context: context,
    //               builder: (context) {
    //                 return TaskScreen();
    //               });
    //         },
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(
    //               Icons.add,
    //               color: Colors.white,
    //             ),
    //             Text(
    //               'ADD A NEW TASk',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    final todaysDate = DateTime.now();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Task"),
        onPressed: () {
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return Dialog(
          //         child: Text("data"),
          //       );
          //     });
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTaskWidget();
              });

          // setState(() {
          //   taskLists.add(TaskModel(id: 4, title: "Hello"));
          // });
        },
      ),
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 50,
        centerTitle: false,

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${todaysDate.year}-${todaysDate.month}-${todaysDate.day}",
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              //need to specify the calender actions.
            },
            icon: Icon(
              // Icons.calendar_month,
              CupertinoIcons.calendar,
              size: 40,
            ),
          ),
        ],
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(200),
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(17.0),
        //         child: Text('18 Jun2024, Tuesday',
        //             style: TextStyle(
        //               fontWeight: FontWeight.w600,
        //               color: Theme.of(context).primaryColor,
        //             )),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(17.0),
        //         child: TextField(
        //           textAlign: TextAlign.center,
        //           decoration: InputDecoration(
        //             hintText: 'Search',
        //             hintStyle: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               color: Colors.white,
        //             ),
        //             prefixIcon: Icon(
        //               Icons.search_rounded,
        //               color: Colors.white,
        //             ),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(25),
        //             ),
        //             fillColor: Theme.of(context).primaryColor,
        //             filled: true,
        //           ),
        //         ),
        //       ),
        //       TabBar(
        //         tabs: [
        //           Tab(text: "Undone"),
        //           Tab(text: "Meetings"),
        //           Tab(text: "Consumption"),
        //         ],
        //         labelColor: Theme.of(context).primaryColor,
        //         unselectedLabelColor: Colors.grey,
        //       ),
        //     ],
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 32,
                ),
                Expanded(
                  child: Text(
                    "Search",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: "Not Done",
              ),
              Tab(
                text: "Progressing",
              ),
              Tab(
                text: "Completed",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) => TaskItemWidget(
                      model: taskLists[index],
                    ),
                    itemCount: taskLists.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 50,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(" progressing"),
              ),
              Container(
                child: Text("completed"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            // autofocus: true,
            decoration: InputDecoration(
              hintText: "Title",
              labelText: "Title",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text("Save"))
        ],
      ),
    );
  }
}
