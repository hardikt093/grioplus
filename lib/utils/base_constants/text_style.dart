import 'package:flutter/material.dart';

import 'base_colors.dart';
import 'base_strings.dart';

class BaseTextStyles {
  static const TextStyle titleText = TextStyle(
      fontSize: 8, fontWeight: FontWeight.w300, color: BaseColors.white);
  static const TextStyle durationText = TextStyle(
      fontSize: 8, fontWeight: FontWeight.w600, color: BaseColors.white);
  static const TextStyle castTitleText = TextStyle(
    fontSize: 10.8,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle castSubTitleText = TextStyle(
      fontSize: 10.8, fontWeight: FontWeight.w600, color: BaseColors.textWhite);

  static const TextStyle errorText = TextStyle(
    color: Colors.red,
    fontSize: 10,
    fontFamily: BaseStrings.montserrat,
    height: 1.5,
  );
  static const TextStyle commonRowText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: BaseColors.whiteText,
  );
  static const TextStyle yearText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: BaseColors.whiteText,
  );
  static const TextStyle tabGreyText = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 11, color: BaseColors.greyText);
  static const TextStyle monthText = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 11, color: BaseColors.greyColor);

/*  static const TextStyle tabGreyText = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 12, color: BaseColors.greyText);*/
  static const TextStyle tabWhiteText = TextStyle(
    color: BaseColors.white,
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle chipText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: BaseColors.white);
  static const TextStyle emailText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: BaseColors.white);
  static const TextStyle dateText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: BaseColors.whiteText);
  static const TextStyle dropDownButtonText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: BaseColors.white);
  static const TextStyle screenDescriptionText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: BaseColors.whiteText);
  static const TextStyle genresText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: BaseColors.textWhite);
  static const TextStyle smallButtonText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: BaseColors.white);
  static const TextStyle seasonTitleText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: BaseColors.textWhite);
  static const TextStyle notificationTitleText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: BaseColors.whiteText);
  static const TextStyle subHeaderText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w700, color: BaseColors.white);

  static const TextStyle planSubDescriptionText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: BaseColors.white);
  static const TextStyle detailsText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: BaseColors.whiteText);
  static const TextStyle showText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: BaseColors.textWhite);
  static const TextStyle planSubDescriptionUnderlineText = TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: BaseColors.white);
  static const TextStyle filterTitleText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: BaseColors.white);
  static const TextStyle bottomTitleText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: BaseColors.textWhite);

  static const TextStyle bottomSheetTitleText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: BaseColors.textWhite);
  static const TextStyle headerCategoryText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: BaseColors.whiteText);
  static const TextStyle downloadButtonText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: BaseColors.whiteText);
  static const TextStyle whiteText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: BaseColors.white);
  static const TextStyle whiteTextUnderline = TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: BaseColors.white);

  static const TextStyle circularTitleText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w700, color: BaseColors.textWhite);
  static const TextStyle billingText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w700, color: BaseColors.white);
  static const TextStyle formFieldText = TextStyle(
      fontSize: 14,
      height: 1.8,
      fontWeight: FontWeight.w400,
      fontFamily: BaseStrings.montserrat,
      color: BaseColors.textColor);
  static const TextStyle formHintText = TextStyle(
      fontSize: 14,
      height: 2.0,
      fontWeight: FontWeight.w400,
      color: BaseColors.authHintColor,
      fontFamily: BaseStrings.montserrat);
  static const TextStyle formHintBoldText = TextStyle(
      fontSize: 14,
      height: 2.0,
      fontWeight: FontWeight.w600,
      color: BaseColors.white,
      fontFamily: BaseStrings.montserrat);

  static const TextStyle calendarText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: BaseColors.searchTextColor);
  static const TextStyle selectedCalendarText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: BaseColors.white);
  static const TextStyle appBarText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: BaseColors.white);
  static const TextStyle logOutText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: BaseColors.secondaryYellowColor);
  static const TextStyle categoriesHeaderText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: BaseColors.white);

  static const TextStyle planHeaderText = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: BaseColors.white);
  static const TextStyle homeTitleText = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: BaseColors.whiteText);

  static const TextStyle planText = TextStyle(
      fontSize: 10, fontWeight: FontWeight.w600, color: BaseColors.white);
  static const TextStyle authTitleText = TextStyle(
      height: 1,
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: BaseColors.white);
}
