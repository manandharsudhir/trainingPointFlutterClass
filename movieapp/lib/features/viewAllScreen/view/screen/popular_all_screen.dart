import 'package:movieapp/features/viewAllScreen/view/widget/all_screen_widget.dart';
import 'package:flutter/material.dart';
import '../widget/view_all_grid_widget.dart';

class PopularAllScreen extends StatelessWidget {
  const PopularAllScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AllScreenWidget(
      title: "Popular Movies",
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ViewAllGridWidget(),
      ),
    );
  }
}