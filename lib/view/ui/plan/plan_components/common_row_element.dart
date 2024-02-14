import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/widgets/text_view.dart';

class CommonRowElement extends StatelessWidget {
  final String? title;

  final String? image1;

  final String? image2;

  final String? image3;
  final String? image4;

  const CommonRowElement(
      {super.key,
      this.title,
      this.image1,
      this.image2,
      this.image3,
      this.image4});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.42,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextView(
              title ?? '',
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              textStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: BaseColors.whiteText),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Image.asset(
          image1 ?? '',
          width: 12,
          height: 12,
        ),
        5.toHSB,
        Image.asset(
          image2 ?? '',
          width: 12,
          height: 12,
        ),
        5.toHSB,
        Image.asset(
          image3 ?? '',
          width: 12,
          height: 12,
        ),
        8.toHSB,
        Image.asset(
          image4 ?? '',
          width: 12,
          height: 12,
        ),
        8.toHSB,
      ],
    );
  }
}
