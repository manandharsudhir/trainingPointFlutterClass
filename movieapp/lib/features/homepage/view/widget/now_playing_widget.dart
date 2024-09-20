import 'package:movieapp/features/shared/widget/movie_item_widget.dart';
import 'package:movieapp/features/viewAllScreen/view/screen/now_playing_all_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/configs/spacing_size.dart';

import '../../../../core/widgets/title_widget.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          title: "Now Playing",
          func: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NowPlayingAllScreen()));
          },
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return MovieItemWidget(
                showPoster: true,
                aspectRatio: 2 / 3,
              );
            },
            separatorBuilder: (context, index) {
              return Spacing.sizedBoxW_16();
            },
            itemCount: 20,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
