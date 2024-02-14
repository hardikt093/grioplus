import 'package:flutter/material.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../base_constants/base_strings.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.hintText});

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.05,
      color: BaseColors.white,
      child: SearchBar(
        leading: Image.asset(
          BaseAssets.searchIcon,
          width: 20,
          height: 20,
        ),
        elevation: const MaterialStatePropertyAll(0),
        hintText: hintText ?? BaseStrings.search,
        hintStyle: const MaterialStatePropertyAll(TextStyle(
            fontSize: 13,
            height: 3,
            fontWeight: FontWeight.w500,
            color: BaseColors.textGreyColor,
            fontFamily: BaseStrings.montserrat)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: BaseColors.borderGreyColor))),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(1, 255, 255, 255)),
      ),
    );
  }
}
