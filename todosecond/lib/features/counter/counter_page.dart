import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todosecond/features/counter/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("rebuilding");
    final counter = ref.watch(counterProvider);
    // ref.watch(counterProvider);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).decrement();
            },
            child: Icon(Icons.minimize_outlined),
          ),
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
