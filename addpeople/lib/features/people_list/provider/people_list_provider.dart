import 'package:flutter_riverpod/flutter_riverpod.dart';

final peopleListProvider = StateProvider<List<String>>((ref) {
  final females = ref.read(femaleProvider);
  final males = ref.read(maleProvider);
  return [...females, ...males];
});

final femaleProvider = StateProvider<List<String>>((ref) => []);
final maleProvider = StateProvider<List<String>>((ref) => []);
