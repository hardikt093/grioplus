import 'dart:async';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grio_plus/utils/base_constants/base_extensions.dart';
import 'package:grio_plus/view/ui/show_details/season_widget.dart';

import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/common/common_playnow.dart';
import '../../../utils/widgets/text_view.dart';
import '../Search/search_screen.dart';
import 'cast_crew_widget.dart';
import 'detail_screen_components/genres_component.dart';
import 'detail_screen_components/languages_component.dart';
import 'detail_screen_components/season_dropdown.dart';
import 'detail_screen_components/tab_component.dart';
import 'more_like_this_widget.dart';

class ShowDetailScreen extends StatefulWidget {
  final bool? isMovie;

  const ShowDetailScreen({super.key, this.isMovie});

  @override
  State<ShowDetailScreen> createState() => _ShowDetailScreenState();
}

class _ShowDetailScreenState extends State<ShowDetailScreen> {
  int? selectedFilter = 0;

  bool _isAdded = false;
  bool _showMore = false;

  List<String>? movieChipFilter = [
    BaseStrings.seasons,
    BaseStrings.castCrew,
    BaseStrings.moreLikeThis,
  ];

  late BetterPlayerController betterPlayerController;
  final StreamController<bool> _placeholderStreamController =
      StreamController.broadcast();
  late bool _showPlaceholder = true;
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    setState(() {
      widget.isMovie == true
          ? movieChipFilter = [
              BaseStrings.castCrew,
              BaseStrings.moreLikeThis,
            ]
          : [
              BaseStrings.seasons,
              BaseStrings.castCrew,
              BaseStrings.moreLikeThis,
            ];
    });

    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      placeholder: buildVideoPlaceholder(),
      fit: BoxFit.cover,
      autoPlay: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ],
      controlsConfiguration: const BetterPlayerControlsConfiguration(
        playIcon: Icons.play_arrow_outlined,
        progressBarPlayedColor: Colors.indigo,
        progressBarHandleColor: Colors.indigo,
        skipBackIcon: Icons.replay_10_outlined,
        skipForwardIcon: Icons.forward_10_outlined,
        backwardSkipTimeInMilliseconds: 10000,
        forwardSkipTimeInMilliseconds: 10000,
        enableSkips: true,
        playerTheme: BetterPlayerTheme.material,
        enablePip: false,
        enablePlayPause: true,
        enableMute: true,
        enableAudioTracks: true,
        enableProgressText: true,
        enableSubtitles: true,
        enableFullscreen: false,
        enablePlaybackSpeed: true,
        loadingColor: Colors.red,
        enableProgressBarDrag: true,
        showControls: true,
        enableOverflowMenu: true,
        showControlsOnInitialize: true,
      ),
      subtitlesConfiguration: const BetterPlayerSubtitlesConfiguration(
        fontSize: 16.0,
      ),
    );
    void setPlaceholderVisibleState(bool hidden) {
      _placeholderStreamController.add(hidden);
      _showPlaceholder = hidden;
    }

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
        // "https://1ckwsmcn-3000.inc1.devtunnels.ms/1704691696988/video/output.m3u8",
        useAsmsSubtitles: true);
    betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    betterPlayerController.setupDataSource(dataSource);

    betterPlayerController.addEventsListener((event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.play) {
        setPlaceholderVisibleState(false);
      }
    });
    betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);

    super.initState();
  }

  Widget buildVideoPlaceholder() {
    return StreamBuilder<bool>(
      stream: _placeholderStreamController.stream,
      builder: (context, snapshot) {
        return _showPlaceholder
            ? Image.network(
                "https://imgix.bustle.com/uploads/image/2020/8/5/23905b9c-6b8c-47fa-bc0f-434de1d7e9bf-avengers-5.jpg")
            : const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BaseColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          InkWell(
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
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              posterContainer(),
              10.toVSB,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const PlayNowWidget(),
                        10.toHSB,
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            _isAdded = !_isAdded;
                            setState(() {});
                          },
                          child: Container(
                            height: size.height * 0.05,
                            width: size.height * 0.055,
                            decoration: BoxDecoration(
                                color: _isAdded
                                    ? BaseColors.secondaryYellowColor
                                    : BaseColors.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: BaseColors.borderWhite)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: _isAdded
                                    ? Image.asset(
                                        BaseAssets.tickIcon,
                                        height: 20,
                                        width: 20,
                                      )
                                    : const Icon(
                                        Icons.add,
                                        color: BaseColors.white,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        10.toHSB,
                        Container(
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                              color: BaseColors.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: BaseColors.borderWhite)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Image.asset(
                                BaseAssets.downloadIcon,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.toVSB,
                    const TextView(
                      BaseStrings.staticLongString,
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: BaseColors.textWhite,
                      ),
                    ),
                    10.toVSB,
                    Visibility(
                      visible: _showMore ? true : false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AvailableLanguageComponent(),
                          10.toVSB,
                          const GenresComponent(),
                          10.toVSB,
                        ],
                      ),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        setState(() {
                          _showMore = !_showMore;
                        });
                      },
                      child: TextView(_showMore ? 'Show Less' : 'Show More...',
                          textStyle: BaseTextStyles.showText),
                    ),
                    10.toVSB,
                    tabContainer(),
                    15.toVSB,
                    Visibility(
                      visible: (selectedFilter == 0 && widget.isMovie == false)
                          ? true
                          : false,
                      child: const SeasonDropdown(),
                    ),
                    Visibility(
                      visible: movieChipFilter?[selectedFilter ?? 0] ==
                              BaseStrings.seasons
                          ? true
                          : false,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: SeasonWidget(),
                      ),
                    ),
                    Visibility(
                      visible: movieChipFilter?[selectedFilter ?? 0] ==
                              BaseStrings.castCrew
                          ? true
                          : false,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: CastCrewWidget(),
                      ),
                    ),
                    movieChipFilter?[selectedFilter ?? 0] ==
                            BaseStrings.moreLikeThis
                        ? const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: MoreLikeThisWidget(),
                          )
                        : Container(),
                    15.toVSB,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabContainer() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: size.height * 0.07,
        width: size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: BaseColors.blackBorderColor,
            ),
            borderRadius: BorderRadius.circular(8),
            color: BaseColors.searchBgColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movieChipFilter?.length,
            // total number of items
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                child: TabComponent(
                  filterTitle: movieChipFilter?[index],
                  isMovie: widget.isMovie!,
                  onPressed: () {
                    setState(() {
                      if (selectedFilter == index) {
                        // Deselect if already selected
                        selectedFilter = null;
                      } else {
                        // Select the new index
                        selectedFilter = index;
                      }
                    });
                  },
                  gradientColor: selectedFilter != index
                      ? [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                        ]
                      : [
                          BaseColors.secondaryYellowColor,
                          BaseColors.secondaryYellowColor,
                          BaseColors.secondaryYellowColor,
                          BaseColors.secondaryYellowColor.withAlpha(90),
                          BaseColors.secondaryYellowColor.withAlpha(80),
                          BaseColors.secondaryYellowColor,
                        ],
                  textColor: BaseColors.white,
                  color: selectedFilter != index
                      ? Colors.transparent
                      : BaseColors.filterChipBgColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget posterContainer() {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: BaseColors.secondaryYellowColor,
          height: size.height * 0.25,
          child: AspectRatio(
              aspectRatio: 18 / 9,
              child: BetterPlayer(controller: betterPlayerController)),
        ),
        Container(
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xCC000000),
                Color(0x99000000),
                Color(0x4f000000),
                Color(0xCC000000),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                3.toVSB,
                const TextView(
                  'Squid Game',
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: BaseColors.whiteText,
                  ),
                ),
                5.toVSB,
                const IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextView(
                        '2022',
                        textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: BaseColors.whiteText),
                      ),
                      VerticalDivider(
                        color: BaseColors.whiteText,
                        thickness: 1,
                      ),
                      TextView(
                        'U/A 13+',
                        textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: BaseColors.whiteText),
                      ),
                      VerticalDivider(
                        color: BaseColors.whiteText,
                        thickness: 1,
                      ),
                      TextView(
                        'Season 1',
                        textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: BaseColors.whiteText),
                      ),
                      VerticalDivider(
                        color: BaseColors.whiteText,
                        thickness: 1,
                      ),
                      TextView('7 Language',
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          textStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: BaseColors.whiteText)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
