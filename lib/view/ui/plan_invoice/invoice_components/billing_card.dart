import 'package:flutter/cupertino.dart';
import 'package:grio_plus/utils/base_constants/text_style.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/widgets/text_view.dart';

class BillingCard extends StatelessWidget {
  const BillingCard({super.key});

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
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextView(
              BaseStrings.billingAddress,
              textStyle: BaseTextStyles.subHeaderText,
            ),
            5.toVSB,
            const Flexible(
              child: TextView(
                'Apt. 936 25658 Renner Stravenue, Shericefort,S 14136',
                textStyle: BaseTextStyles.planSubDescriptionText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
