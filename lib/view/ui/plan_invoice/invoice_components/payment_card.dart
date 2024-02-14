import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

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
              BaseStrings.paymentMethod,
              textStyle: BaseTextStyles.subHeaderText,
            ),
            5.toVSB,
            const Flexible(
              child: TextView(
                'Visa Card Type ending in 1111',
                textStyle: BaseTextStyles.planSubDescriptionText,
              ),
            ),
            3.toVSB,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  BaseStrings.expiration,
                  textStyle: BaseTextStyles.planSubDescriptionText,
                ),
                TextView(
                  '01/2023',
                  textStyle: BaseTextStyles.downloadButtonText,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
