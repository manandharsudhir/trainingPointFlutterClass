import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/counter/conter_second_page.dart';
import 'package:todosecond/features/counter/counter_page.dart';
import 'package:todosecond/features/counter/provider/counter_provider.dart';

class CounterThirdPage extends ConsumerStatefulWidget {
  CounterThirdPage({
    super.key,
  });
  @override
  ConsumerState<CounterThirdPage> createState() => _CounterThirdPageState();
}

class _CounterThirdPageState extends ConsumerState<CounterThirdPage> {
  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);
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
                      return CounterSecondPage();
                    },
                  ),
                );
              },
              child: Text('Go to second page'),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).update((value) {
            value = value + 1;
            return value;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
