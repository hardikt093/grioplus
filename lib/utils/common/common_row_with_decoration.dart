import 'package:flutter/material.dart';

import '../widgets/text_view.dart';

class CommonRowWithDecoration extends StatefulWidget {
  final String? title;
  final Color? color;
  final Color? textColor;
  final List<Color>? gradientColor;
  final void Function()? onPressed;

  const CommonRowWithDecoration(
      {super.key,
      this.title,
      this.color,
      this.textColor,
      this.gradientColor,
      this.onPressed});

  @override
  State<CommonRowWithDecoration> createState() =>
      _CommonRowWithDecorationState();
}

class _CommonRowWithDecorationState extends State<CommonRowWithDecoration> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: size.height * 0.045,
        decoration: BoxDecoration(
          gradient: SweepGradient(colors: widget.gradientColor!),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
                onPressed: widget.onPressed,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextView(widget.title!,
                      fontSize: 12,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: widget.textColor),
                )),
          ),
        ),
      ),
    );
  }
}
