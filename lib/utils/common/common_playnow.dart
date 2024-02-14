import 'package:flutter/material.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../base_constants/base_extensions.dart';
import '../base_constants/base_strings.dart';
import '../widgets/text_view.dart';

class PlayNowWidget extends StatelessWidget {
  const PlayNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      decoration: BoxDecoration(
        color: BaseColors.secondaryYellowColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              BaseAssets.playIcon,
              width: 18,
              height: 18,
            ),
            5.toHSB,
            const Center(
              child: TextView(
                BaseStrings.playNow,
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: BaseColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
