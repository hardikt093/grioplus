import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';

final List<Map<String, dynamic>> priceList = [
  {
    "title2": "Free Trial ",
    "title": '1 Week',
  },
  {
    "title": " \$15.99 ",
    "title2": " Silver",
  },
  {
    "title": " \$15.99 ",
    "title2": " Gold",
  },
  {
    "title": " \$15.99 ",
    "title2": "Platinum",
  },

  // Add more items as needed
];

class PlanTabComponent extends StatefulWidget {
  final int? selectedTabIndex;

  const PlanTabComponent({super.key, this.selectedTabIndex = 0});

  @override
  State<PlanTabComponent> createState() => _PlanTabComponentState();
}

class _PlanTabComponentState extends State<PlanTabComponent> {
  int? selectedTabIndex1;

  @override
  void initState() {
    setState(() {
      selectedTabIndex1 = widget.selectedTabIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: priceList.length,
          // total number of items
          itemBuilder: (context, index) {
            return planTab(
                filterText1: priceList[index]["title"],
                filterText2: priceList[index]["title2"],
                onPressed: () {
                  setState(() {
                    if (widget.selectedTabIndex == index) {
                      selectedTabIndex1 = null;
                    } else {
                      selectedTabIndex1 = index;
                    }
                  });
                },
                gradientColor: widget.selectedTabIndex != index
                    ? [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                      ]
                    : [
                        BaseColors.secondaryYellowColor,
                        BaseColors.secondaryYellowColor,
                        BaseColors.secondaryYellowColor,
                        BaseColors.secondaryYellowColor.withAlpha(90),
                        BaseColors.secondaryYellowColor.withAlpha(80),
                        BaseColors.secondaryYellowColor,
                      ],
                color: widget.selectedTabIndex != index
                    ? Colors.transparent
                    : BaseColors.primaryColor,
                borderColor: widget.selectedTabIndex == index
                    ? Colors.transparent
                    : BaseColors.blackBorderColor);
          },
        ),
      ),
    );
  }

  Widget planTab(
      {Color? color,
      Color? borderColor,
      List<Color>? gradientColor,
      String? filterText1,
      String? filterText2,
      void Function()? onPressed}) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
            gradient: SweepGradient(colors: gradientColor!),
            borderRadius: BorderRadius.circular(
              8,
            ),
            border: Border.all(color: borderColor ?? Colors.transparent)),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: size.width * 0.32,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        filterText2!,
                        textStyle: BaseTextStyles.tabGreyText,
                      ),
                      TextView(
                        filterText1 ?? '',
                        textStyle: BaseTextStyles.tabWhiteText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
