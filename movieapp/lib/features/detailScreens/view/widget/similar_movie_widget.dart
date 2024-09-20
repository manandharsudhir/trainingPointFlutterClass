import 'package:movieapp/core/configs/style/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/configs/spacing_size.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../shared/widget/movie_item_widget.dart';

class SimilarMoviesWidget extends StatelessWidget {
  const SimilarMoviesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Similar Movies",
            style: AppTextStyle.heading5,
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return MovieItemWidget(
                aspectRatio: 1.6,
              );
            },
            separatorBuilder: (context, index) {
              return Spacing.sizedBoxW_16();
            },
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
