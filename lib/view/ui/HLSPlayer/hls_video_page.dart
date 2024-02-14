import 'dart:async';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/base_constants/base_colors.dart';

class HlsVideoPage extends StatefulWidget {
  const HlsVideoPage({super.key});

  @override
  HlsVideoPageState createState() => HlsVideoPageState();
}

class HlsVideoPageState extends State<HlsVideoPage> {
  late BetterPlayerController _betterPlayerController;
  final StreamController<bool> _placeholderStreamController =
      StreamController.broadcast();

  late bool _showPlaceholder = true;

  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 1000), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    });

    BetterPlayerControlsConfiguration controlsConfiguration =
         BetterPlayerControlsConfiguration(
      controlBarColor: Colors.black26,
      iconsColor: Colors.white,
      playIcon: Icons.play_arrow_outlined,
      progressBarPlayedColor: Colors.indigo,
      progressBarHandleColor: Colors.indigo,
      skipBackIcon: Icons.replay_10_outlined,
      skipForwardIcon: Icons.forward_10_outlined,
      backwardSkipTimeInMilliseconds: 10000,
      forwardSkipTimeInMilliseconds: 10000,
      enableSkips: true,
      enablePip: true,
      enablePlayPause: true,
      enableMute: true,
      enableAudioTracks: true,
      enableProgressText: true,
      enableSubtitles: true,
      showControlsOnInitialize: true,
      enablePlaybackSpeed: true,
      loadingColor: Colors.red,
      overflowModalColor: Colors.black54,
      overflowModalTextColor: Colors.white,
      overflowMenuIconsColor: Colors.white,
      enableProgressBarDrag: true,
      showControls: true,playerTheme: BetterPlayerTheme.material,
          controlBarHeight: 30,
          customControlsBuilder: (controller, onPlayerVisibilityChanged) => CustomBetterPlayerControls(controller: _betterPlayerController),

    );

    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      placeholder: buildVideoPlaceholder(),
      fit: BoxFit.cover,
      aspectRatio: 16 / 9,
      deviceOrientationsOnFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ],
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ],
      showPlaceholderUntilPlay: true,
      systemOverlaysAfterFullScreen: [SystemUiOverlay.bottom],
      controlsConfiguration: controlsConfiguration,
      subtitlesConfiguration: const BetterPlayerSubtitlesConfiguration(
        fontSize: 14,
      ),
    );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
        // "https://1ckwsmcn-3000.inc1.devtunnels.ms/1704691696988/video/output.m3u8",
        useAsmsSubtitles: true);
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);

    _betterPlayerController.addEventsListener((event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.play) {
        _setPlaceholderVisibleState(false);
      }
    });
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _betterPlayerController.dispose();
    super.dispose();
  }

  void _setPlaceholderVisibleState(bool hidden) {
    _placeholderStreamController.add(hidden);
    _showPlaceholder = hidden;
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
    return Scaffold(
      backgroundColor: BaseColors.primaryColor,
      body: BetterPlayer(controller: _betterPlayerController),
    );
  }
}


class CustomBetterPlayerControls extends StatelessWidget {
  final BetterPlayerController controller;

  const CustomBetterPlayerControls({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Custom back button positioned at top-left corner
        Positioned(
          top: 0,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        // Your custom widgets can be added here
        // For example, a play/pause button
        Positioned(
          bottom: 0,
          left: 0,
          child: IconButton(
            icon: const Icon( Icons.ac_unit),
            onPressed: () {
               controller.play();
            },
          ),
        ),
        // You can add more custom widgets as needed
      ],
    );
  }
}
