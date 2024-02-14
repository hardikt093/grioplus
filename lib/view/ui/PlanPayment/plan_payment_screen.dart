import 'package:flutter/material.dart';
import '../../../utils/base_constants/base_extensions.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/common/common_title_description.dart';
import '../../../utils/widgets/button_widget.dart';
import '../../../utils/widgets/text_view.dart';
import '../plan_invoice/invoice_screen.dart';
import 'plan_payment_components/payment_information.dart';
import 'plan_payment_components/plan_form_fields.dart';

class PlanPaymentScreen extends StatefulWidget {
  const PlanPaymentScreen({super.key});

  @override
  State<PlanPaymentScreen> createState() => _PlanPaymentScreenState();
}

class _PlanPaymentScreenState extends State<PlanPaymentScreen> {
  final planFormKey = GlobalKey<FormState>();
  final planInformationKey = GlobalKey<FormState>();
  String? chosenValue;
  String? countryValue;
  String? stateValue;
  String? cityValue;

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
          BaseStrings.makePayment,
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
                const TextView(BaseStrings.totalPayable,
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
                        style: BaseTextStyles.tabGreyText,
                      ),
                    ],
                  ),
                )
              ],
            ),
            8.toVSB,
            CustomFormButton(
                buttonText: "Pay \$15.99",
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  paymentButton(context);
                  paymentInformationButton(context);
                },
                backgroundColor: BaseColors.secondaryYellowColor,
                textColor: BaseColors.white),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CommonTitleDescription(
                title: BaseStrings.makePaymentToSubscribe,
                description: BaseStrings.lorem,
              ),
              20.toVSB,
              PlanFormFields(
                planFormKey: planFormKey,
                countryValue: countryValue,
                stateValue: stateValue,
                cityValue: cityValue,
              ),
              const Divider(
                thickness: 1,
                color: BaseColors.blackBorderColor,
              ),
              PaymentInformation(planInformationKey: planInformationKey),
            ],
          ),
        ),
      ),
    );
  }

  void paymentButton(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const InvoiceScreen()),
    );
  }

  void paymentInformationButton(BuildContext context) {
    // if (planInformationKey.currentState!.validate()) {}
  }
}
