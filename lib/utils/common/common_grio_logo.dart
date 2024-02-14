import 'package:flutter/material.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';

class GrioLogo extends StatefulWidget {
  final double? width;
  final double? height;

  const GrioLogo({super.key, this.width, this.height});

  @override
  State<GrioLogo> createState() => GrioLogoState();
}

class GrioLogoState extends State<GrioLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        color: BaseColors.authBlackColor,
        child: Image.asset(BaseAssets.grioImageLogo));
  }
}
