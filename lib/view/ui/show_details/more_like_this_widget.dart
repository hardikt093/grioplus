import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../home/components/common_movie_widget.dart';

List<String> imageItem = [
  BaseAssets.movieImage1,
  BaseAssets.movieImage2,
  BaseAssets.movieImage3,
  BaseAssets.movieImage1,
];

class MoreLikeThisWidget extends StatefulWidget {
  const MoreLikeThisWidget({super.key});

  @override
  State<MoreLikeThisWidget> createState() => _MoreLikeThisWidgetState();
}

class _MoreLikeThisWidgetState extends State<MoreLikeThisWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: size.height * 0.2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 8,
          ),
          itemCount: imageItem.length,
          itemBuilder: (context, index) {
            return CommonMovieWidget(image: imageItem[index]);
          },
        ),
        10.toVSB,
      ]),
    );
  }
}
