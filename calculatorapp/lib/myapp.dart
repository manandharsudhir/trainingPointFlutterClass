import 'package:calculatorapp/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(
          0xff3646EC,
        ),
      ),
      home: CalculatorScreen(),
    );
  }
}
