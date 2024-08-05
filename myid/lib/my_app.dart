import 'package:flutter/material.dart';
import 'package:myid/homepage.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(
          // fontFamily: "Poppins",
          ),
    );
  }
}
