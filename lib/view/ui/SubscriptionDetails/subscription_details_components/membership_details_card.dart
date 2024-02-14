import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/common_spaced_row.dart';
import '../../../../utils/widgets/text_view.dart';

class MembershipDetailsCard extends StatefulWidget {
  const MembershipDetailsCard({super.key});

  @override
  State<MembershipDetailsCard> createState() => _MembershipDetailsCardState();
}

class _MembershipDetailsCardState extends State<MembershipDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: BaseColors.searchBgColor,
          border: Border.all(
            color: BaseColors.blackBorderColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextView(
              BaseStrings.gold,
                textStyle: BaseTextStyles.smallButtonText
            ),
            10.toVSB,
            const CommonSpacedRow(
              leadingText: BaseStrings.adsFreeMovies,
            ),
            8.toVSB,
            const CommonSpacedRow(
              leadingText: BaseStrings.watchOnTVOrLaptop,
            ),
            8.toVSB,
            const CommonSpacedRow(
              leadingText: BaseStrings.streamitSpecial,
            ),
            8.toVSB,
            const CommonSpacedRow(
              leadingText: BaseStrings.maxVideoQuality,
            ),
            8.toVSB,
          ],
        ),
      ),
    );
  }
}
