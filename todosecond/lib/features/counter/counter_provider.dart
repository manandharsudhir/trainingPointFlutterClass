import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider =
    StateNotifierProvider<CounterProvider, int>((ref) => CounterProvider());

class CounterProvider extends StateNotifier<int> {
  CounterProvider() : super(0);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }
}
