import 'package:addpeople/features/people_list/provider/people_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeopleListScreen extends ConsumerWidget {
  const PeopleListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final people = ref.watch(peopleListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("List of people"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddPeople());
        },
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            padding: EdgeInsets.all(16),
            child: Text(people[index]),
          );
        },
      ),
    );
  }
}

class AddPeople extends ConsumerWidget {
  const AddPeople({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFormField(),
        ElevatedButton(
            onPressed: () {
              ref.read(peopleListProvider.notifier).update(
                (value) {
                  value.add("ram");
                  return [...value];
                },
              );

              // peopleListProvider.add("value");
            },
            child: Text("Save"))
      ],
    );
  }
}
