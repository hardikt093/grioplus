import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      decoration: BoxDecoration(
          border: Border.all(color: BaseColors.blackBorders),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                    width: size.width * 0.30,
                    height: size.height * 0.10,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                            color: BaseColors.primaryColor.withOpacity(0.8)),
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
            8.toHSB,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      child: TextView(
                        'Continue Watching',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textStyle: BaseTextStyles.notificationTitleText,
                      ),
                    ),
                    3.toVSB,
                    const Flexible(
                      child: TextView(
                        'Sound Like Love',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textStyle: BaseTextStyles.smallButtonText,
                      ),
                    ),
                    5.toVSB,
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: TextView(
                '3 Days Ago',
                textStyle: BaseTextStyles.durationText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
