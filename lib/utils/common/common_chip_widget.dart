import 'package:flutter/material.dart';
import '../base_constants/text_style.dart';
import '../widgets/text_view.dart';

class CommonChipWidget extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final List<Color>? gradientColor;
  final String? filterTitle;
  final void Function()? onPressed;

  const CommonChipWidget(
      {super.key,
      this.color,
      this.filterTitle,
      this.textColor,
      this.onPressed,
      this.gradientColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Container(
        height: size.height * 0.045,
        decoration: BoxDecoration(
          gradient: SweepGradient(colors: gradientColor!),
          borderRadius: BorderRadius.circular(
            50.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
                onPressed: onPressed,
                child: TextView(filterTitle!,
                    textStyle: BaseTextStyles.chipText,
                  color: textColor,

                    )),
          ),
        ),
      ),
    );
  }
}
