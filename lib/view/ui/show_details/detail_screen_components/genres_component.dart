import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';

List<String>? genreList = ["Action", "Adventure"];

class GenresComponent extends StatelessWidget {
  const GenresComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              BaseAssets.genresImage,
              width: 20,
              height: 20,
            ),
            5.toHSB,
            const TextView(
              BaseStrings.genres,
              textStyle: BaseTextStyles.genresText,
            ),
          ],
        ),
        10.toVSB,
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: BaseColors.searchBgColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: BaseColors.blackBorderColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Center(
                  child: TextView('Action',
                      textStyle: BaseTextStyles.screenDescriptionText),
                ),
              ),
            ),
            5.toHSB,
            Container(
              decoration: BoxDecoration(
                  color: BaseColors.searchBgColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: BaseColors.blackBorderColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Center(
                  child: TextView('Adventure',
                      textStyle: BaseTextStyles.screenDescriptionText),
                ),
              ),
            ),
            5.toHSB,
          ],
        )
      ],
    );
  }
}
