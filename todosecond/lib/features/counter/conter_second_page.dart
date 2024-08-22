import 'package:flutter/material.dart';
import 'package:todosecond/features/counter/counter_page.dart';
import 'package:todosecond/features/counter/counter_third_page.dart';

class CounterSecondPage extends StatefulWidget {
  CounterSecondPage({super.key});

  @override
  State<CounterSecondPage> createState() => _CounterSecondPageState();
}

class _CounterSecondPageState extends State<CounterSecondPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CounterPage();
                    },
                  ),
                );
              },
              child: Text('Go to first page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CounterThirdPage();
                    },
                  ),
                );
              },
              child: Text('Go to Third page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
