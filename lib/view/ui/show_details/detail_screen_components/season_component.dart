import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';

class SeasonCard extends StatelessWidget {
  const SeasonCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: BaseColors.blackBorderColor,
          ),
          borderRadius: BorderRadius.circular(8),
          color: BaseColors.searchBgColor),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * 0.32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                          width: size.width * 0.32,
                          height: size.height * 0.10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            BaseAssets.notificationImage,
                            fit: BoxFit.fill,
                          )),
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
                                  color:
                                      BaseColors.primaryColor.withOpacity(0.8)),
                              child: const Padding(
                                padding: EdgeInsets.all(2),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 25,
                                  color: BaseColors.white,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  6.toVSB,
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
            8.toHSB,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  10.toVSB,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextView('1. Red Light, Green Light',
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          textStyle: BaseTextStyles.genresText),
                      InkWell(
                        child: Image.asset(
                          BaseAssets.downloadIcon,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                  3.toVSB,
                  const Flexible(
                      child: TextView(BaseStrings.staticLongString,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                          textStyle: BaseTextStyles.genresText)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
