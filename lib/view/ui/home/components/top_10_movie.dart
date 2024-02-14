import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';

class Top10MovieWidget extends StatelessWidget {
  final String? image;
  final String? numberImage;

  final VoidCallback? onTap;

  const Top10MovieWidget({super.key, this.image, this.numberImage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
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
          Positioned(
            left: -12,
            bottom: 5,
            width: 40,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Image.asset(
                  numberImage ?? '',
                  width: 50,
                  height: 50,
                )),
          ),
        ],
      ),
    );
  }
}
