import 'package:movieapp/core/configs/spacing_size.dart';
import 'package:movieapp/core/configs/style/text_styles.dart';
import 'package:movieapp/core/utils/date_utils.dart';
import 'package:movieapp/core/widgets/image_builder.dart';
import 'package:movieapp/features/detailScreens/view/widget/similar_movie_widget.dart';
import 'package:movieapp/features/shared/widget/movie_vote_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                ImageBuilder(
                  url:
                      "https://www.themoviedb.org/t/p/w1280/x9YC2rpXHUFMqI1hCekKDm9UE4w.jpg",
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Monsters (2024)",
                                  style: AppTextStyle.heading3,
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      "${(DateTime.now()).getFormattedDate()} • ",
                                      style: AppTextStyle.overline,
                                    ),
                                    ...List.generate(
                                      3,
                                      (index) => Text(
                                        "${"Comedy"}${index < (3 - 1) ? "," : ""} ",
                                        style: AppTextStyle.overline,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          MovieVoteWidget(voteAverage: 4),
                        ],
                      ),
                      Text("tagline"),
                      Spacing.sizedBoxH_16(),
                      const Text(
                        "Overview",
                        style: AppTextStyle.heading5,
                      ),
                      Text(
                        "The story of the Menéndez brothers, who were convicted in 1996 of murdering their parents José and Mary Louise “Kitty” Menéndez.",
                        style: AppTextStyle.bodySmall,
                      ),
                      SimilarMoviesWidget()
                    ],
                  ),
                )
              ],
            ),
            const Positioned(
              top: 16,
              left: 16,
              child: CircleAvatar(
                child: BackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
