import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/common/common_playnow.dart';
import '../../../utils/widgets/text_view.dart';
import '../Search/search_screen.dart';
import '../plan/plan_screen.dart';
import 'components/movies_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageItem = [
    BaseAssets.movieImage1,
    BaseAssets.movieImage2,
    BaseAssets.movieImage3,
    BaseAssets.movieImage1,
    BaseAssets.movieImage2
  ];

  List<String> recentlyPlayed = [
    BaseAssets.recentlyPlayed,
    BaseAssets.recentlyPlayed,
    BaseAssets.recentlyPlayed,
    BaseAssets.recentlyPlayed,
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

  int _currentIndex = 0;

  final List<String> images = [
    BaseAssets.homePoster,
    BaseAssets.homePoster,
    BaseAssets.homePoster,
    BaseAssets.homePoster,
    BaseAssets.homePoster,
  ];

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
                width: size.width * 0.2,
                child: Image.asset(
                  BaseAssets.grioImageLogo,
                )),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PlanScreen(),
                  ),
                );
              },
              child: Container(
                height: size.height * 0.03,
                width: size.width * 0.25,
                decoration: BoxDecoration(
                    color: BaseColors.secondaryYellowColor,
                    borderRadius: BorderRadius.circular(6)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Center(
                    child: TextView(
                      BaseStrings.subscribe,
                      textStyle: BaseTextStyles.smallButtonText,
                    ),
                  ),
                ),
              ),
            ),
            10.toHSB,
            InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  BaseAssets.search,
                  width: size.width * 0.055,
                  height: size.height * 0.055,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              posterContainer(),
              25.toVSB,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PlayNowWidget(),
                  10.toHSB,
                  Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        color: BaseColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: BaseColors.borderWhite)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: BaseColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              10.toVSB,
              dotIndicator(),
              10.toVSB,
              const MoviesList(),
              30.toVSB,
            ],
          ),
        ),
      ),
    );
  }

  Widget dotIndicator() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(images.length, (index) {
          double dotSize = (index == _currentIndex) ? 10.0 : 7;
          return Container(
            width: dotSize,
            height: dotSize,
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == _currentIndex)
                  ? BaseColors.secondaryYellowColor
                  : Colors.grey,
            ),
          );
        }),
      ),
    );
  }

  Widget posterContainer() {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: size.height * 0.5,
            enlargeCenterPage: true,
            autoPlay: false,
            enableInfiniteScroll: false,
            viewportFraction: 1.5,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -15,
          child: Container(
            width: size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xb2000000),
                Color(0x66000000),
                Color(0x00000000),
                Color(0xc9000000)
              ],
            )),
            child: const Center(
              child: TextView("Actions | Adventure | Crime | Drama ",
                  textStyle: BaseTextStyles.headerCategoryText),
            ),
          ),
        )
      ],
    );
  }
}
