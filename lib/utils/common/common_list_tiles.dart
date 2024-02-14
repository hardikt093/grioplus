import 'package:flutter/material.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../base_constants/base_extensions.dart';
import '../base_constants/base_strings.dart';
import '../base_constants/text_style.dart';
import '../widgets/text_view.dart';

class CommonListTile extends StatefulWidget {
  final String? title;
  final String? icon;
  final bool? hasSubscription;
  final void Function()? onTap;

  const CommonListTile(
      {super.key,
      this.title,
      this.icon,
      this.hasSubscription = false,
      this.onTap});

  @override
  State<CommonListTile> createState() => _CommonListTileState();
}

class _CommonListTileState extends State<CommonListTile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: widget.onTap,
        child: ListTile(
          tileColor: BaseColors.searchBgColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          dense: true,
          visualDensity: const VisualDensity(vertical: -1),
          leading: Image.asset(
            widget.icon!,
            width: size.width * 0.05,
            height: size.height * 0.05,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              widget.hasSubscription == true
                  ? Container(
                      height: size.height * 0.03,
                      width: size.width * 0.15,
                      decoration: BoxDecoration(
                          color: BaseColors.secondaryYellowColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        child: Center(
                          child: TextView(
                            BaseStrings.gold,
                            textStyle: BaseTextStyles.whiteText,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              5.toHSB,
              Image.asset(
                BaseAssets.forwardIcon,
                width: size.width * 0.05,
                height: size.height * 0.05,
              ),
            ],
          ),
          title: TextView(
            widget.title!,
            color: BaseColors.whiteText,
          ),
          shape: RoundedRectangleBorder(
            side:
                const BorderSide(color: BaseColors.blackBorderColor, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
