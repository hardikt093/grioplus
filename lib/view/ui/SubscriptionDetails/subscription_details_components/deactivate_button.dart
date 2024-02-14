import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/button_widget.dart';
import '../../../../utils/widgets/text_view.dart';

class DeactivateButton extends StatefulWidget {
  const DeactivateButton({super.key});

  @override
  State<DeactivateButton> createState() => DeactivateButtonState();
}

class DeactivateButtonState extends State<DeactivateButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () {
        showDeactivateBottomSheet(context);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: BaseColors.blackBorderColor))),
        fixedSize: MaterialStateProperty.resolveWith((states) {
          return Size(
            size.width,
            size.height * 0.056,
          );
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return BaseColors.searchBgColor;
            }
            return BaseColors.searchBgColor; // defer to the defaults
          },
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            BaseAssets.subscriptionIcon,
            width: size.width * 0.05,
            height: size.height * 0.05,
          ),
          5.toHSB,
          const TextView(BaseStrings.deactivatePlan,
              textStyle: BaseTextStyles.downloadButtonText),
        ],
      ),
    );
  }
}

void showDeactivateBottomSheet(
  BuildContext context, {
  final VoidCallback? onCameraPressed,
  final VoidCallback? onGalleryPressed,
}) {
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return Container(
          height: size.height * 0.25,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: BaseColors.bottomNavigationBarColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextView(BaseStrings.deactivatePlan,
                      textStyle: BaseTextStyles.categoriesHeaderText),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        BaseAssets.closeIcon,
                        width: 16,
                        height: 16,
                      ),
                    ),
                  )
                ],
              ),
              10.toVSB,
              const TextView(BaseStrings.deactivatePlansDescription,
                  textStyle: BaseTextStyles.billingText),
              15.toVSB,
              CustomFormButton(
                  buttonText: BaseStrings.deactivate,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  },
                  backgroundColor: BaseColors.secondaryYellowColor,
                  textColor: BaseColors.white),
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0))));
}
