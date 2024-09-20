import 'package:movieapp/features/viewAllScreen/view/screen/popular_all_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/configs/spacing_size.dart';

import '../../../../core/widgets/title_widget.dart';
import '../../../shared/widget/movie_item_widget.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
            title: "Popular Movies",
            func: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PopularAllScreen()));
            }),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return MovieItemWidget(
                aspectRatio: 1.6,
              );
            },
            separatorBuilder: (context, index) {
              return Spacing.sizedBoxW_16();
            },
            itemCount: 20,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
