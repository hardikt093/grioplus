import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/custom_payment_text_form_field.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../../helper/validators.dart';

List<String> monthItem = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
];
int? selectedMonth = 0;

class PaymentInformation extends StatefulWidget {
  final GlobalKey? planInformationKey;

  const PaymentInformation({super.key, this.planInformationKey});

  @override
  State<PaymentInformation> createState() => _PaymentInformationState();
}

class _PaymentInformationState extends State<PaymentInformation> {
  final validators = Validators();
  final cardController = TextEditingController();
  final expirationDateController = TextEditingController();
  final yearController = TextEditingController();
  final cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: widget.planInformationKey,
      child: Column(
        children: [
          5.toVSB,
          const Align(
            alignment: Alignment.centerLeft,
            child: TextView(
              BaseStrings.paymentInformation,
              textStyle: BaseTextStyles.categoriesHeaderText,
            ),
          ),
          5.toVSB,
          const Align(
            alignment: Alignment.centerLeft,
            child: TextView(
              BaseStrings.weAcceptCards,
              textStyle: BaseTextStyles.planSubDescriptionText,
            ),
          ),
          10.toVSB,
          CustomPaymentTextFormField(
            labelText: BaseStrings.carNumber,
            isRequiredField: true,
            hintText: BaseStrings.carNumber,
            hasPrefixIcon: false,
            textInputAction: TextInputAction.next,
            textEditingController: cardController,
            showErrorText: false,
            validator: (value) => validators.validateFirstName(value!),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                  text: BaseStrings.expirationDate,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: BaseColors.searchTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                  children: [
                    TextSpan(
                        text: '*',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontStyle: FontStyle.normal,
                              color: BaseColors.searchTextColor,
                              letterSpacing: 0.1,
                              fontSize: 13,
                            ))
                  ]),
            ),
          ),
          5.toVSB,
          Row(
            children: [
              Expanded(
                child: CustomPaymentTextFormField(
                  labelText: "",
                  isRequiredField: false,
                  isReadOnly: true,
                  hintText: "01",
                  hasSuffixIcon: true,
                  hasPrefixIcon: false,
                  textInputAction: TextInputAction.next,
                  textEditingController: expirationDateController,
                  showErrorText: false,
                  onTap: () => handleMonthPicker(context),
                  validator: (value) => validators.validateMonth(value!),
                ),
              ),
              20.toHSB,
              Expanded(
                child: CustomPaymentTextFormField(
                  labelText: "",
                  isRequiredField: false,
                  isReadOnly: true,
                  hintText: "xxxx",
                  hasSuffixIcon: true,
                  hasPrefixIcon: false,
                  textInputAction: TextInputAction.next,
                  textEditingController: yearController,
                  showErrorText: false,
                  onTap: () => handleYearPicker(context),
                  validator: (value) => validators.validateYear(value!),
                ),
              ),
            ],
          ),
          8.toVSB,
          CustomPaymentTextFormField(
            labelText: BaseStrings.cvc,
            isRequiredField: true,
            hintText: "xxx",
            hasPrefixIcon: false,
            textInputAction: TextInputAction.next,
            textEditingController: cvcController,
            showErrorText: false,
            validator: (value) => validators.validateCVC(value!),
          ),
          Container(
            height: size.height * 0.15,
          ),
        ],
      ),
    );
  }

  void handleYearPicker(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: BaseColors.secondaryYellowColor,
            onSurface: BaseColors.searchTextColor,
          ),
        ),
        child: AlertDialog(
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: BaseColors.searchBgColor),
          ),
          backgroundColor: BaseColors.searchBgColor,
          title: const TextView(
            BaseStrings.selectYear,
            textStyle: BaseTextStyles.headerCategoryText,
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: YearPicker(
              selectedDate: yearController.text != ""
                  ? DateFormat("yyyy").parse(yearController.text)
                  : null,
              firstDate: DateTime.now(),
              lastDate: DateTime(2090),
              onChanged: (val) {
                yearController.text = DateFormat("yyyy").format(val);
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  void handleMonthPicker(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: BaseColors.secondaryYellowColor,
            onSurface: BaseColors.searchTextColor,
          ),
        ),
        child: AlertDialog(
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: BaseColors.searchBgColor),
          ),
          backgroundColor: BaseColors.searchBgColor,
          title: const TextView(
            BaseStrings.selectMonth,
            textStyle: BaseTextStyles.headerCategoryText,
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 10 / 5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10, // spacing between columns
              ),
              itemCount: monthItem.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedMonth != index) {
                        selectedMonth = index;
                      } else {
                        selectedMonth = -1;
                      }
                    });
                    expirationDateController.text =
                        (selectedMonth! + 1).toString();
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: selectedMonth == index
                          ? BaseColors.secondaryYellowColor
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: TextView(
                        monthItem[index],
                        textStyle: selectedMonth == index
                            ? BaseTextStyles.selectedCalendarText
                            : BaseTextStyles.calendarText,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
