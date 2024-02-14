import 'package:flutter/material.dart';

import 'text_view.dart';

class CustomFormButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPressed;

  const CustomFormButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        fixedSize: MaterialStateProperty.resolveWith((states) {
          return Size(
            size.width,
            size.height * 0.056,
          );
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return backgroundColor;
            }
            return backgroundColor; // defer to the defaults
          },
        ),
      ),
      child: TextView(buttonText,
          textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }
}
