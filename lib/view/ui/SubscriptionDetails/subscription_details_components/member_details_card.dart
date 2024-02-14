import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/common_spaced_row.dart';
import '../../../../utils/widgets/text_view.dart';

class MemberDetailsCard extends StatefulWidget {
  const MemberDetailsCard({super.key});

  @override
  State<MemberDetailsCard> createState() => MemberDetailsCardState();
}

class MemberDetailsCardState extends State<MemberDetailsCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "ID",
                      style:BaseTextStyles.dateText
                  ),
                  TextSpan(
                    text: " #5DD2C1E83FB ",
                    style: BaseTextStyles.subHeaderText
                  ),
                  TextSpan(
                    text: "On November 12, 2023",
                    style:BaseTextStyles.dateText
                  ),
                ],
              ),
            ),
            10.toVSB,
            const TextView(
              "Henry Clark",
                textStyle: BaseTextStyles.subHeaderText
            ),
            5.toVSB,
            CommonSpacedRow(
              leadingText: BaseStrings.membershipLevel,
              trailingWidget: Container(
                height: size.height * 0.03,
                width: size.width * 0.15,
                decoration: BoxDecoration(
                    color: BaseColors.secondaryYellowColor,
                    borderRadius: BorderRadius.circular(6)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Center(
                    child: TextView(BaseStrings.gold,
                        textStyle: BaseTextStyles.smallButtonText),
                  ),
                ),
              ),
            ),
            5.toVSB,
            const CommonSpacedRow(
              leadingText: BaseStrings.membershipExpires,
              trailingWidget: TextView("2, Feb 2024",
                  textStyle: BaseTextStyles.smallButtonText),
            ),
            5.toVSB,
          ],
        ),
      ),
    );
  }
}
