import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/counter/counter_page.dart';
import 'package:todosecond/features/homepage/view/screens/second_home_scren.dart';
import 'package:todosecond/features/test_homepage.dart';

import 'features/homepage/view/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const TestHomepage(),
      ),
    );
  }
}
