import 'package:flutter/material.dart';

import '../../../../core/widgets/image_builder.dart';

class ViewAllGridWidget extends StatelessWidget {
  const ViewAllGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        child: ImageBuilder(
            url:
                "https://media.themoviedb.org/t/p/w600_and_h900_bestv2/x9YC2rpXHUFMqI1hCekKDm9UE4w.jpg"),
      ),
      itemCount: 10,
      padding: const EdgeInsets.all(20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
