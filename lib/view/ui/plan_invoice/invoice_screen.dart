import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/widgets/text_view.dart';
import '../SubscriptionDetails/subscription_details_components/member_details_card.dart';
import '../dashboard/dashboard.dart';
import 'invoice_components/billing_card.dart';
import 'invoice_components/download_invoice_button.dart';
import 'invoice_components/payment_card.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: BaseColors.primaryColor,
          elevation: 0,
          centerTitle: true,
          title: const TextView(BaseStrings.invoice,
              textStyle: BaseTextStyles.appBarText),
          actions: [
            InkWell(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                  (route) => false,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  BaseAssets.homeWhite,
                  color: BaseColors.white,
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ]),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              10.toVSB,
              const TextView(
                'Thank You \n For Your Membership to Grio+',
                textStyle: BaseTextStyles.planHeaderText,
                textAlign: TextAlign.center,
              ),
              10.toVSB,
              const TextView(
                'Your Premium membership is now active',
                textStyle: BaseTextStyles.subHeaderText,
                textAlign: TextAlign.center,
              ),
              10.toVSB,
              const TextView(
                BaseStrings.staticLongString,
                textStyle: BaseTextStyles.screenDescriptionText,
                textAlign: TextAlign.center,
              ),
              12.toVSB,
              const MemberDetailsCard(),
              10.toVSB,
              const BillingCard(),
              10.toVSB,
              const PaymentCard(),
              10.toVSB,
              const DownloadInvoiceButton()
            ],
          ),
        ),
      )),
    );
  }
}
