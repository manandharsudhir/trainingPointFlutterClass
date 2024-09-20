import 'package:movieapp/core/utils/date_utils.dart';
import 'package:movieapp/features/detailScreens/view/screen/detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/style/text_styles.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/widgets/image_builder.dart';
import 'movie_vote_widget.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    super.key,
    this.showPoster = false,
    this.aspectRatio = 1,
  });

  final double aspectRatio;
  final bool showPoster;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailScreen()));
      },
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              SizedBox(
                height: 200,
                child: ImageBuilder(
                  url:
                      "https://www.themoviedb.org/t/p/w1280/x9YC2rpXHUFMqI1hCekKDm9UE4w.jpg",
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Moview title",
                        style: AppTextStyle.heading5,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: (DateTime.now()).getFormattedDate(),
                              style: AppTextStyle.overline.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                          text: "Released On: ",
                          style: AppTextStyle.overline,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: MovieVoteWidget(voteAverage: 4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
