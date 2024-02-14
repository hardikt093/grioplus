import 'package:flutter/material.dart';

import '../base_constants/base_extensions.dart';
import '../base_constants/text_style.dart';
import '../widgets/text_view.dart';

class CommonBottomSheetRow extends StatefulWidget {
  final String? image;
  final String? title;

  const CommonBottomSheetRow({super.key, this.image, this.title});

  @override
  State<CommonBottomSheetRow> createState() => _CommonBottomSheetRowState();
}

class _CommonBottomSheetRowState extends State<CommonBottomSheetRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.image != null
                ? Image.asset(
                    widget.image!,
                    width: 18,
                    height: 18,
                  )
                : Container(),
            10.toHSB,
            TextView(
              widget.title ?? '',
              textStyle: BaseTextStyles.bottomTitleText,
            ),
          ],
        ),
      ],
    );
  }
}
