import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/common/common_title_description.dart';
import '../../../utils/widgets/button_widget.dart';
import '../../../utils/widgets/text_view.dart';
import '../PlanPayment/plan_payment_screen.dart';
import '../show_details/detail_screen_components/tab_component.dart';
import 'plan_components/monthly_component.dart';
import 'plan_components/plan_tab_component.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  List<String>? tabFilter = [
    BaseStrings.monthly,
    BaseStrings.quarterly,
    BaseStrings.annually,
  ];
  final List<Map<String, dynamic>> priceList = [
    {
      "title": "Free Trial",
      "title2": ' / 1 Week',
    },
    {
      "title": " \$15.99",
      "title2": " / 1 month",
    },
    {
      "title": " \$20.99",
      "title2": ' / 3 month',
    },
    // Add more items as needed
  ];

  int? selectedFilter = 0;
  int? selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: BaseColors.primaryColor,
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
              width: size.width * 0.2,
              child: Image.asset(
                BaseAssets.grioImageLogo,
              )),
        ),
        actions: [
          10.toHSB,
          InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.close,
                size: 25,
                color: BaseColors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(BaseAssets.planBgImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  20.toVSB,
                  const CommonTitleDescription(
                    title:
                        "Subscribe with premium plan or Continue with 7 Days Free Trial",
                    description: BaseStrings.staticLongString,
                  ),
                  20.toVSB,
                  tabContainer(),
                  15.toVSB,
                  const MonthlyComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: size.height * 0.24,
        width: double.infinity,
        child: Column(
          children: [
            15.toVSB,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PlanTabComponent(
                selectedTabIndex: selectedTabIndex,
              ),
            ),
            20.toVSB,
            Container(
              height: size.height * 0.13,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: BaseColors.bottomNavigationBarColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextView(
                        BaseStrings.youHaveToPay,
                        textStyle: BaseTextStyles.smallButtonText,
                      ),
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
                      buttonText: BaseStrings.subscribe,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const PlanPaymentScreen()),
                        );
                      },
                      backgroundColor: BaseColors.secondaryYellowColor,
                      textColor: BaseColors.white),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget tabContainer() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        height: size.height * 0.07,
        width: size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: BaseColors.blackBorderColor,
            ),
            borderRadius: BorderRadius.circular(8),
            color: BaseColors.searchBgColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tabFilter?.length,
            // total number of items
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: TabComponent(
                  filterTitle: tabFilter?[index],
                  onPressed: () {
                    setState(() {
                      if (selectedFilter == index) {
                        // Deselect if already selected
                        selectedFilter = null;
                      } else {
                        // Select the new index
                        selectedFilter = index;
                      }
                    });
                  },
                  gradientColor: selectedFilter != index
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
                  textColor: BaseColors.white,
                  color: selectedFilter != index
                      ? Colors.transparent
                      : BaseColors.filterChipBgColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
