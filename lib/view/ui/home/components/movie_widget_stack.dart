import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';

class MovieWidgetStack extends StatelessWidget {
  final String? image;
  final VoidCallback? onTap;

  const MovieWidgetStack({super.key, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.30,
            height: MediaQuery.of(context).size.height * 0.22,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: BaseColors.borderWhite)),
            child: Image.asset(
              image ?? '',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 5,
          top: 5,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                  color: BaseColors.redColor,
                  borderRadius: BorderRadius.circular(4)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: TextView(BaseStrings.recentlyAdded,
                    textStyle: BaseTextStyles.titleText),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
