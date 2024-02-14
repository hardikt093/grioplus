import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/widgets/text_view.dart';
import '../home/components/common_movie_widget.dart';

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

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: BaseColors.primaryColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: BaseColors.white,
          ),
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const TextView(
            BaseStrings.watchlist,
              textStyle: BaseTextStyles.appBarText
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // number of items in each row
              mainAxisExtent: size.height * 0.2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8, // spacing between columns
            ),
            // padding around the grid
            itemCount: imageItem.length,
            // total number of items
            itemBuilder: (context, index) {
              return CommonMovieWidget(image: imageItem[index]);
            },
          ),
        ));
  }
}
