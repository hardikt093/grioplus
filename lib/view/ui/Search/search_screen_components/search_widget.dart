import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.hintText});

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SearchBar(
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Image.asset(
          BaseAssets.searchIcon,
          width: size.width * 0.05,
          height: size.height * 0.05,
        ),
      ),
      elevation: const MaterialStatePropertyAll(0),
      hintText: hintText ?? BaseStrings.searchText,
      constraints: BoxConstraints(
        maxHeight: size.height * 0.085,
      ),
      textStyle: const MaterialStatePropertyAll(TextStyle(
          fontSize: 14,
          height: 1.8,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: BaseColors.white,
          fontFamily: BaseStrings.montserrat)),
      hintStyle: const MaterialStatePropertyAll(TextStyle(
          fontSize: 14,
          height: 2.1,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: BaseColors.searchTextColor,
          fontFamily: BaseStrings.montserrat)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: BaseColors.searchBgColor),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(BaseColors.searchBgColor),
    );
  }
}
