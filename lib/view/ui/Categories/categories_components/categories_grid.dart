import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/common_chip_widget.dart';

final List<String> movieChipFilter = [
  BaseStrings.movies,
  BaseStrings.tvShows,
  BaseStrings.actions,
  BaseStrings.newReleases,
  BaseStrings.grioOriginals,
  BaseStrings.drama,
  BaseStrings.documentaries,
  BaseStrings.music,
  BaseStrings.romance,
  BaseStrings.thriller,
  BaseStrings.sciFi,
  BaseStrings.comedy,
  BaseStrings.curatedTube,
  BaseStrings.kids,
  BaseStrings.shorts,
];
int? selectedFilter;

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: size.height * 0.05,
        mainAxisSpacing: 8,
        crossAxisSpacing: 15,
      ),
      itemCount: movieChipFilter.length,
      // total number of items
      itemBuilder: (context, index) {
        return CommonChipWidget(
          filterTitle: movieChipFilter[index],
          onPressed: () {
            setState(() {
              if (selectedFilter != index) {
                selectedFilter = index;
              } else {
                selectedFilter = -1;
              }
            });
          },
          gradientColor: selectedFilter != index
              ? [
                  BaseColors.redGradientColor,
                  BaseColors.redGradientColor,
                  BaseColors.redGradientColor,
                  BaseColors.redGradientColor.withAlpha(90),
                  BaseColors.redGradientColor.withAlpha(80),
                  BaseColors.redGradientColor,
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
          color: BaseColors.filterChipBgColor,
        );
      },
    );
  }
}
