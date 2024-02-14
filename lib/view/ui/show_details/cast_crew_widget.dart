import 'package:flutter/material.dart';
import 'package:grio_plus/utils/base_constants/base_extensions.dart';
import 'package:grio_plus/view/ui/show_details/detail_screen_components/cast_crew_component.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/widgets/text_view.dart';

class CastCrewWidget extends StatelessWidget {
  const CastCrewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextView(
          BaseStrings.cast,
          textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: BaseColors.white),
        ),
        10.toVSB,
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: size.height * 0.08,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                right: 7,
                bottom: 10,
              ),
              child: CastCrewComponent(
                filterTitle: 'Christian Bale',
                textColor: BaseColors.textWhite,
                color: BaseColors.filterChipBgColor,
                subTitle: 'Gorr the God Butcher',
                gradientColor: [
                  BaseColors.redGradientColor,
                  BaseColors.redGradientColor,
                  BaseColors.redGradientColor,
                  BaseColors.redGradientColor.withAlpha(90),
                  BaseColors.redGradientColor.withAlpha(80),
                  BaseColors.redGradientColor.withOpacity(0.8),
                ],
              ),
            );
          },
        ),
        const TextView(
          BaseStrings.crew,
          textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: BaseColors.white),
        ),
        10.toVSB,
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: size.height * 0.08,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                right: 7,
                bottom: 10,
              ),
              child: CastCrewComponent(
                filterTitle: 'Christian Bale',
                textColor: BaseColors.textWhite,
                color: BaseColors.filterChipBgColor,
                subTitle: 'Gorr the God Butcher',
                gradientColor: [
                  BaseColors.redGradientColor,
                  BaseColors.redGradientColor,
                  BaseColors.redGradientColor,
                  BaseColors.redGradientColor.withAlpha(90),
                  BaseColors.redGradientColor.withAlpha(80),
                  BaseColors.redGradientColor.withOpacity(0.8),
                ],
              ),
            );
          },
        ),
        10.toVSB,
      ],
    );
  }
}
