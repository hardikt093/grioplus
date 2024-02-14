import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';

class CommonMovieWidget extends StatelessWidget {
  final String? image;
  final VoidCallback? onTap;

  const CommonMovieWidget({super.key, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.30,
        height: MediaQuery.of(context).size.height * 0.22,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BaseColors.borderWhite)),
        child: Image.asset(
          image ?? '',
          width: MediaQuery.of(context).size.width * 0.30,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
