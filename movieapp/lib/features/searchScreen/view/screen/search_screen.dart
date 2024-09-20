import 'dart:developer';

import 'package:movieapp/features/searchScreen/view/widget/typeto_search_widget.dart';
import 'package:flutter/material.dart';

import '../../../viewAllScreen/view/widget/view_all_grid_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchFieldController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  searchFieldController.clear();
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                )),
          ),
          autofocus: true,
          controller: searchFieldController,
          onChanged: (value) {},
        ),
      ),
      body: ViewAllGridWidget(),
    );
  }
}
