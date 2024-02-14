import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_extensions.dart';
import 'detail_screen_components/season_component.dart';

class SeasonWidget extends StatelessWidget {
  const SeasonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.toVSB,
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: SeasonCard(),
            );
          },
        ),
      ],
    );
  }
}
