import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/text_style.dart';

List<String> list = <String>[
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12'
];

class PaymentDropdown extends StatefulWidget {
  const PaymentDropdown({super.key});

  @override
  State<PaymentDropdown> createState() => _PaymentDropdownState();
}

class _PaymentDropdownState extends State<PaymentDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Center(
          child: DropdownButtonFormField<String>(
            value: dropdownValue,
            borderRadius: BorderRadius.circular(8),
            selectedItemBuilder: (BuildContext context) {
              return list.map((String value) {
                return Text(
                  dropdownValue,
                  style: BaseTextStyles.formFieldText,
                );
              }).toList();
            },
            icon: Image.asset(
              BaseAssets.dropdownIcon,
              width: 20,
              height: 20,
            ),
            elevation: 0,
            menuMaxHeight: size.height * 0.20,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 0, left: 15, right: 8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: BaseColors.textFieldBackgroundColor,
                filled: true),
            style: BaseTextStyles.formFieldText,
            onChanged: (value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownColor: BaseColors.textFieldBackgroundColor,
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                enabled: true,
                child: Container(
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: SweepGradient(
                        colors: (value == dropdownValue)
                            ? [
                                BaseColors.secondaryYellowColor,
                                BaseColors.secondaryYellowColor,
                                BaseColors.secondaryYellowColor,
                                BaseColors.secondaryYellowColor.withAlpha(90),
                                BaseColors.secondaryYellowColor.withAlpha(80),
                                BaseColors.secondaryYellowColor,
                              ]
                            : [
                                Colors.transparent,
                                Colors.transparent,
                              ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: BaseColors.textFieldBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          value,
                          style: BaseTextStyles.formFieldText,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
