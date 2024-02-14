import 'package:flutter/material.dart';

import '../base_constants/base_colors.dart';
import '../base_constants/base_extensions.dart';
import '../base_constants/text_style.dart';
import '../widgets/text_view.dart';

class CommonTitleDescription extends StatelessWidget {
  final String? title;
  final String? description;

  const CommonTitleDescription({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextView(
          title ?? '',
          textStyle: BaseTextStyles.planHeaderText,
          textAlign: TextAlign.center,
        ),
        10.toVSB,
        TextView(
          description ?? '',
          textStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: BaseColors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
