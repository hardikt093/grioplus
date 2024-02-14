import 'package:flutter/material.dart';

import '../base_constants/base_extensions.dart';
import '../base_constants/text_style.dart';
import '../widgets/text_view.dart';

class CommonAuthTitleDescription extends StatelessWidget {
  final String greetingText;
  final String title;
  final String? boldText;
  final String? endText;

  const CommonAuthTitleDescription(
      {super.key,
      this.greetingText = "",
      this.title = "",
      this.boldText,
      this.endText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextView(
            greetingText,
            textStyle: BaseTextStyles.categoriesHeaderText,
            textAlign: TextAlign.start,
          ),
        ),
        5.toVSB,
        Align(
          alignment: Alignment.centerLeft,
          child: TextView(
            title,
            textStyle: BaseTextStyles.authTitleText,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
