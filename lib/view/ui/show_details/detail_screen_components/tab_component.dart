import 'package:flutter/material.dart';

import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';

class TabComponent extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final List<Color>? gradientColor;
  final String? filterTitle;
  final void Function()? onPressed;
  final bool? isMovie;

  const TabComponent(
      {super.key,
      this.color,
      this.filterTitle,
      this.textColor,
      this.onPressed,
      this.gradientColor,
      this.isMovie = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      child: Container(
        height: size.height * 0.055,
        decoration: BoxDecoration(
          gradient: SweepGradient(colors: gradientColor!),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: isMovie == true ? size.width * 0.4 : size.width * 0.27,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextView(filterTitle ?? '',
                      textStyle: BaseTextStyles.filterTitleText,
                      color: textColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
