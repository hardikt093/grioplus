import 'package:flutter/material.dart';

import '../../view/ui/home/components/common_movie_widget.dart';
import '../base_constants/base_assets.dart';
import '../base_constants/base_extensions.dart';
import '../base_constants/base_strings.dart';
import '../base_constants/text_style.dart';
import '../widgets/text_view.dart';

List<String> imageItem = [
  BaseAssets.movieImage1,
  BaseAssets.movieImage2,
  BaseAssets.movieImage3,
  BaseAssets.movieImage1,
  BaseAssets.movieImage2,
  BaseAssets.movieImage1,
  BaseAssets.movieImage2,
  BaseAssets.movieImage3,
  BaseAssets.movieImage1,
  BaseAssets.movieImage2
];

class CommonRecommendedWidget extends StatefulWidget {
  const CommonRecommendedWidget({super.key});

  @override
  State<CommonRecommendedWidget> createState() =>
      _CommonRecommendedWidgetState();
}

class _CommonRecommendedWidgetState extends State<CommonRecommendedWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const TextView(BaseStrings.recommendedForYou,
          textStyle: BaseTextStyles.categoriesHeaderText),
      10.toVSB,
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: size.height * 0.2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 8, // spacing between columns
        ),
        itemCount: imageItem.length,
        itemBuilder: (context, index) {
          return CommonMovieWidget(image: imageItem[index]);
        },
      ),
      10.toVSB,
    ]);
  }
}
