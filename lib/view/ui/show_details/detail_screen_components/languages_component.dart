import 'package:flutter/cupertino.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';

class AvailableLanguageComponent extends StatelessWidget {
  const AvailableLanguageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              BaseAssets.globeImage,
              width: 20,
              height: 20,
            ),
            5.toHSB,
            const TextView(BaseStrings.availableLanguages,
                textStyle: BaseTextStyles.genresText),
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
                  child: TextView('English',
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
                  child: TextView('Hindi',
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
                  child: TextView('Tamil',
                      textStyle: BaseTextStyles.screenDescriptionText),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
