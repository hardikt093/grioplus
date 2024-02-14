import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/widgets/button_widget.dart';
import '../../../utils/widgets/text_view.dart';
import 'subscription_details_components/deactivate_button.dart';
import 'subscription_details_components/member_details_card.dart';
import 'subscription_details_components/membership_details_card.dart';

class SubscriptionDetailsScreen extends StatefulWidget {
  const SubscriptionDetailsScreen({super.key});

  @override
  State<SubscriptionDetailsScreen> createState() =>
      _SubscriptionDetailsScreenState();
}

class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BaseColors.primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: BaseColors.white,
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const TextView(
          BaseStrings.subscriptionDetails,
          textStyle: BaseTextStyles.appBarText,
        ),
      ),
      floatingActionButton: Container(
        height: size.height * 0.13,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: BaseColors.bottomNavigationBarColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextView(BaseStrings.totalBilled,
                    textStyle: BaseTextStyles.smallButtonText),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "\$15.99",
                        style: BaseTextStyles.smallButtonText,
                      ),
                      TextSpan(
                        text: "/ 1 month",
                        style: BaseTextStyles.monthText
                      ),
                    ],
                  ),
                )
              ],
            ),
            8.toVSB,
            CustomFormButton(
                buttonText: BaseStrings.upgradePlan,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                backgroundColor: BaseColors.secondaryYellowColor,
                textColor: BaseColors.white),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            10.toVSB,
            const MemberDetailsCard(),
            20.toVSB,
            const MembershipDetailsCard(),
            20.toVSB,
            const DeactivateButton(),
          ],
        ),
      ),
    );
  }
}
