import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/common_bottomsheet_row.dart';
import '../../../../utils/widgets/text_view.dart';

void showMenuOptionBottomSheet(
  BuildContext context, {
  final VoidCallback? onCameraPressed,
  final VoidCallback? onGalleryPressed,
}) {
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return Container(
          height: size.height * 0.30,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: BaseColors.bottomNavigationBarColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              5.toVSB,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextView(
                    BaseStrings.strangerThings,
                    textStyle: BaseTextStyles.categoriesHeaderText,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      BaseAssets.closeIcon,
                      width: 16,
                      height: 16,
                    ),
                  )
                ],
              ),
              20.toVSB,
              const CommonBottomSheetRow(
                  title: BaseStrings.viewMoreDetail,
                  image: BaseAssets.infoIcon),
              8.toVSB,
              const Divider(
                thickness: 1,
                color: BaseColors.blackBorderColor,
              ),
              8.toVSB,
              const CommonBottomSheetRow(
                  title: BaseStrings.downloadEpisode,
                  image: BaseAssets.downloadIcon),
              8.toVSB,
              const Divider(
                thickness: 1,
                color: BaseColors.blackBorderColor,
              ),
              8.toVSB,
              const CommonBottomSheetRow(
                  title: BaseStrings.removeFromRow, image: BaseAssets.closeIcon)
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0))));
}
