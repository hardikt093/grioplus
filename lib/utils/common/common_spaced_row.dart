import 'package:flutter/material.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../widgets/text_view.dart';

class CommonSpacedRow extends StatelessWidget {
  final String? leadingText;
  final Widget? trailingWidget;

  const CommonSpacedRow({super.key, this.leadingText, this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          leadingText!,
          color: BaseColors.whiteText,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        trailingWidget != null
            ? trailingWidget!
            : Image.asset(
                BaseAssets.checkYellowIcon,
                width: 15,
                height: 15,
              ),
      ],
    );
  }
}
