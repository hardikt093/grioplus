import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';
import 'common_row_element.dart';

final List<Map<String, dynamic>> myDataList = [
  {
    "title": "Ads free movies and shows",
    "image1": BaseAssets.checkYellowIcon,
    "image2": BaseAssets.checkYellowIcon,
    "image3": BaseAssets.checkYellowIcon,
    "image4": BaseAssets.checkYellowIcon
  },
  {
    "title": "Watch on TV or Laptop",
    "image1": BaseAssets.closeWhiteIcon,
    "image2": BaseAssets.closeWhiteIcon,
    "image3": BaseAssets.checkYellowIcon,
    "image4": BaseAssets.checkYellowIcon
  },
  {
    "title": "Streamit Specia",
    "image1": BaseAssets.closeWhiteIcon,
    "image2": BaseAssets.checkYellowIcon,
    "image3": BaseAssets.checkYellowIcon,
    "image4": BaseAssets.checkYellowIcon
  },
  {
    "title": "Max video quality",
    "image1": BaseAssets.closeWhiteIcon,
    "image2": BaseAssets.checkYellowIcon,
    "image3": BaseAssets.checkYellowIcon,
    "image4": BaseAssets.checkYellowIcon
  },
];

class MonthlyComponent extends StatelessWidget {
  const MonthlyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: BaseColors.blackBorderColor),
          color: BaseColors.searchBgColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const TextView(
                      BaseStrings.free,
                      textStyle: BaseTextStyles.planText,
                      textAlign: TextAlign.center,
                    ),
                    10.toHSB,
                    const TextView(
                      BaseStrings.silver,
                      textStyle: BaseTextStyles.planText,
                      textAlign: TextAlign.center,
                    ),
                    10.toHSB,
                    const TextView(
                      BaseStrings.gold,
                      textStyle: BaseTextStyles.planText,
                      textAlign: TextAlign.center,
                    ),
                    10.toHSB,
                    const TextView(
                      BaseStrings.platinum,
                      textStyle: BaseTextStyles.planText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            9.toVSB,
            ListView.builder(
              itemCount: myDataList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: CommonRowElement(
                    title: myDataList[index]["title"],
                    image1: myDataList[index]["image1"],
                    image2: myDataList[index]["image2"],
                    image3: myDataList[index]["image3"],
                    image4: myDataList[index]["image4"],
                  ),
                );
              },
            ),
            9.toVSB,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: TextView(
                BaseStrings.staticLongString,
                textStyle: BaseTextStyles.commonRowText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
