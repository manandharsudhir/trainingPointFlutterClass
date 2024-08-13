import 'package:flutter/material.dart';
import 'package:to_do_app/screens/first_screen.dart';

void main() {
  runApp(
    const ToDoApp(),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 24, 6, 142),

        //this is used to give theme to all the icons used in application
        iconTheme: IconThemeData(color: Colors.white),

        // This is used to setup colors of action icons in appbar
        // appBarTheme: AppBarTheme(
        //   actionsIconTheme: IconThemeData(color: Colors.white)
        // )

        //this is used to theme the texts
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.white,
        //       displayColor: Colors.white,
        //     ),
      ),
      home: FirstScreen(),
    );
  }
}
