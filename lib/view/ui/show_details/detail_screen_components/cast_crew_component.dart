import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/widgets/text_view.dart';

class CastCrewComponent extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final List<Color>? gradientColor;
  final String? filterTitle;
  final String? subTitle;
  final void Function()? onPressed;

  const CastCrewComponent(
      {super.key,
      this.color,
      this.filterTitle,
      this.textColor,
      this.onPressed,
      this.subTitle,
      this.gradientColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        height: size.height * 0.075,
        decoration: BoxDecoration(
          gradient: SweepGradient(colors: gradientColor!),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              child: Center(
                                  child: Image.asset(
                                BaseAssets.movieImage1,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              )),
                            ),
                          ),
                        ),
                        5.toHSB,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: TextView(filterTitle!,
                                    fontSize: 10.8,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600,
                                    color: textColor),
                              ),
                              Flexible(
                                child: TextView(subTitle ?? '',
                                    fontSize: 10.8,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    color: BaseColors.textWhite),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
