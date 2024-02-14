import 'package:flutter/material.dart';
import 'package:grio_plus/utils/base_constants/text_style.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../show_details/show_details_screen.dart';
import 'bottom_sheet.dart';
import 'circular_movie_widget.dart';
import 'common_movie_widget.dart';
import 'movie_widget_stack.dart';
import 'recently_played.dart';
import 'top_10_movie.dart';

List<String> imageItem = [
  BaseAssets.movieImage1,
  BaseAssets.movieImage2,
  BaseAssets.movieImage3,
  BaseAssets.movieImage1,
  BaseAssets.movieImage2
];
List<String> top10Movies = [
  BaseAssets.movieImage1,
  BaseAssets.movieImage2,
  BaseAssets.movieImage3,
  BaseAssets.movieImage1,
  BaseAssets.movieImage2,
  BaseAssets.movieImage2,
  BaseAssets.movieImage2,
  BaseAssets.movieImage2,
  BaseAssets.movieImage2,
  BaseAssets.movieImage2,
];
List<String> number = [
  BaseAssets.one,
  BaseAssets.two,
  BaseAssets.three,
  BaseAssets.four,
  BaseAssets.five,
  BaseAssets.six,
  BaseAssets.seven,
  BaseAssets.eight,
  BaseAssets.nine,
  BaseAssets.ten,
];
List<String> imageGenres = [
  BaseAssets.action,
  BaseAssets.family,
  BaseAssets.movieImage3,
];

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextView(BaseStrings.recentlyPlayed,
              textStyle:BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.19,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: RecentlyPlayedWidget(
                      image: imageItem[index],
                      onTap: () {
                        showMenuOptionBottomSheet(context);
                      }),
                );
              },
            ),
          ),
          10.toVSB,
          const TextView(BaseStrings.trending,
              textStyle: BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.22,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: MovieWidgetStack(
                    image: imageItem[index],
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowDetailScreen(
                            isMovie: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          10.toVSB,
          const TextView(BaseStrings.top10Movies,
              textStyle: BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.23,
            child: ListView.builder(
              itemCount: top10Movies.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Top10MovieWidget(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowDetailScreen(
                            isMovie: true,
                          ),
                        ),
                      );
                    },
                      image: top10Movies[index], numberImage: number[index]),
                );
              },
            ),
          ),
          5.toVSB,
          const TextView(BaseStrings.curatedTube,
              textStyle:BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.20,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CommonMovieWidget(
                      image: imageItem[index],
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ShowDetailScreen(
                                    isMovie: false,
                                  )),
                        );
                      }),
                );
              },
            ),
          ),
          10.toVSB,
          const TextView(BaseStrings.newRelease,
              textStyle: BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.20,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CommonMovieWidget(image: imageItem[index],
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowDetailScreen(
                            isMovie: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          10.toVSB,
          const TextView(BaseStrings.listByGenres,
              textStyle: BaseTextStyles.categoriesHeaderText),
          5.toVSB,
          SizedBox(
            height: size.height * 0.18,
            child: ListView.builder(
              itemCount: imageGenres.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircularMovieWidget(image: imageGenres[index]),
                );
              },
            ),
          ),
          5.toVSB,
          const TextView(BaseStrings.top10Shows,
              textStyle: BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.23,
            child: ListView.builder(
              itemCount: top10Movies.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Top10MovieWidget(
                      image: top10Movies[index], numberImage: number[index],
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowDetailScreen(
                            isMovie: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          5.toVSB,
          const TextView(BaseStrings.popularMovies,
              textStyle: BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.20,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CommonMovieWidget(image: imageItem[index],
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowDetailScreen(
                            isMovie: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          10.toVSB,
          const TextView(BaseStrings.grioOriginals,
              textStyle: BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.20,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CommonMovieWidget(image: imageItem[index],
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowDetailScreen(
                            isMovie: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          10.toVSB,
          const TextView(BaseStrings.curatedNostalgia,
              textStyle: BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.20,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CommonMovieWidget(image: imageItem[index],
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowDetailScreen(
                            isMovie: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          10.toVSB,
          const TextView(BaseStrings.watchInYourLanguage,
              textStyle: BaseTextStyles.categoriesHeaderText),
          5.toVSB,
          SizedBox(
            height: size.height * 0.18,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircularMovieWidget(image: imageItem[index]),
                );
              },
            ),
          ),
          5.toVSB,
          const TextView(BaseStrings.documentaries,
              textStyle: BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.20,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CommonMovieWidget(image: imageItem[index],
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowDetailScreen(
                            isMovie: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          10.toVSB,
          const TextView(BaseStrings.kids,
              textStyle: BaseTextStyles.categoriesHeaderText),
          10.toVSB,
          SizedBox(
            height: size.height * 0.20,
            child: ListView.builder(
              itemCount: imageItem.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CommonMovieWidget(image: imageItem[index],
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowDetailScreen(
                            isMovie: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
