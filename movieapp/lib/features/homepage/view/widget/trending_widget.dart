import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/core/configs/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:movieapp/core/constants/api_constants.dart';
import 'package:movieapp/features/homepage/provider/trending_provider.dart';
import '../../../../core/widgets/image_builder.dart';

class TrendingMovies extends ConsumerWidget {
  const TrendingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingMovies = ref.watch(trendingProvider);

    return trendingMovies.when(
      data: (data) {
        return FlutterCarousel(
          options: CarouselOptions(
            height: 200.0,
            showIndicator: false,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            enableInfiniteScroll: true,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: List.generate(data.length, (index) {
            return Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: ImageBuilder(
                    url:
                        "${ApiConstants.imageBaseUrl}${data[index].backdropPath}",
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[index].title ?? "",
                        style: AppTextStyle.heading4,
                      ),
                      Text(
                        data[index].overview ?? "",
                        style: AppTextStyle.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text(error.toString())),
    );
  }
}
