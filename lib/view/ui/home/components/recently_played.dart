import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../HLSPlayer/hls_video_page.dart';

class RecentlyPlayedWidget extends StatelessWidget {
  final String? image;
  final VoidCallback? onTap;

  const RecentlyPlayedWidget({super.key, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: BaseColors.blackBorderColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: InkWell(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HlsVideoPage()))
                .then((value) {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown
              ]);
            });
          },
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.20,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Image.asset(
                        image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: BaseColors.primaryColor.withOpacity(0.8)),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.asset(
                            BaseAssets.playIcon,
                            width: 32,
                            height: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              1.toVSB,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextView('S2-E4',
                      textStyle: BaseTextStyles.seasonTitleText),
                  InkWell(
                    onTap: onTap,
                    child: Image.asset(
                      BaseAssets.menuIcon,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
              5.toVSB,
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: const LinearProgressIndicator(
                  backgroundColor: BaseColors.bottomNavigationBarColor,
                  color: BaseColors.secondaryYellowColor,
                  minHeight: 3,
                  value: 0.4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
