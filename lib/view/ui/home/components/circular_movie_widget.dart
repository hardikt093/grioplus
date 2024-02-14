import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';

class CircularMovieWidget extends StatelessWidget {
  final String? image;

  const CircularMovieWidget({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff1A1A1A),
            image: DecorationImage(
              image: AssetImage(BaseAssets.gradientBorder),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                color: Color(0xff1A1A1A),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(
                    image ?? '',
                  ),
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Align(
              alignment: Alignment.center,
              child: TextView(
                'ROMANCE',
                textStyle: BaseTextStyles.circularTitleText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
