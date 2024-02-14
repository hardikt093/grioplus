import 'package:flutter/material.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';

Widget loadingWidget(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: size.height,
    width: size.width,
    color: BaseColors.primaryColor.withOpacity(0.3),
    child: Center(
      child: Image.asset(
        width: size.width * 0.15,
        height: size.height * 0.06,
        BaseAssets.loadingGif,
      ),
    ),
  );
}
