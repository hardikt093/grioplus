import 'package:flutter/material.dart';

import '../base_constants/base_colors.dart';

void showSnackBar(
  BuildContext context,
  String message, {
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      overflow: TextOverflow.ellipsis,
    ),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.startToEnd,
    backgroundColor: isError ? BaseColors.redColor : BaseColors.greenColor,
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ));
}
