import 'package:movieapp/core/configs/spacing_size.dart';
import 'package:movieapp/features/searchScreen/view/screen/search_screen.dart';

import 'package:flutter/material.dart';

import '../widget/now_playing_widget.dart';
import '../widget/popular_widget.dart';
import '../widget/trending_widget.dart';
import '../widget/upcoming_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              const TrendingMovies(),
              Positioned(
                right: 16,
                top: 16,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchScreen()));
                    },
                    child: const CircleAvatar(child: Icon(Icons.search))),
              )
            ],
          ),
          const NowPlayingWidget(),
          const PopularMovieWidget(),
          const UpcomingWidget(),
          Spacing.sizedBoxH_32(),
        ],
      ),
    );
  }
}
