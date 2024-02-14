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
List<String> selectedFilters = [];

class SearchFilterChip extends StatefulWidget {
  const SearchFilterChip({super.key});

  @override
  State<SearchFilterChip> createState() => _SearchFilterChipState();
}

class _SearchFilterChipState extends State<SearchFilterChip> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: movieChipFilter.map((filter) {
            return CommonChipWidget(
              filterTitle: filter,
              onPressed: () {
                setState(() {
                  if (mounted) {
                    if (!selectedFilters.contains(filter)) {
                      selectedFilters.add(filter);
                    } else {
                      selectedFilters.remove(filter);
                    }
                  }
                });
              },
              gradientColor: !selectedFilters.contains(filter)
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
          }).toList(),
        ),
      ],
    );
  }
}
