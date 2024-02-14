import 'package:flutter/material.dart';
import 'package:grio_plus/utils/base_constants/text_style.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/widgets/text_view.dart';

List<String> list = <String>['Seasons 1', 'Seasons 2', 'Seasons 3'];

class SeasonDropdown extends StatefulWidget {
  const SeasonDropdown({super.key});

  @override
  State<SeasonDropdown> createState() => _SeasonDropdownState();
}

class _SeasonDropdownState extends State<SeasonDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      width: size.width * 0.28,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Center(
          child: DropdownButtonFormField<String>(
            value: dropdownValue,
            borderRadius: BorderRadius.circular(8),
            selectedItemBuilder: (BuildContext context) {
              return list.map((String value) {
                return TextView(
                  dropdownValue,
                  textStyle: BaseTextStyles.smallButtonText,
                );
              }).toList();
            },
            icon: Image.asset(
              BaseAssets.dropdownIcon,
              width: 20,
              height: 20,
            ),
            elevation: 0,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 0, left: 8, right: 8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: BaseColors.borderWhite,
                  ),
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: BaseColors.borderWhite,
                  ),
                ),
                fillColor: BaseColors.primaryColor,
                filled: true),
            style: BaseTextStyles.smallButtonText,
            onChanged: (value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownColor: BaseColors.searchBgColor,
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
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                              ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: BaseColors.searchBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child:
                            Text(value, style: BaseTextStyles.smallButtonText),
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
