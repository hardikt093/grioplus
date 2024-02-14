import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base_constants/base_colors.dart';
import '../base_constants/base_extensions.dart';
import '../base_constants/base_strings.dart';

class CustomTextFormField extends StatelessWidget {
  final String? errorText;
  final String? hintText;
  final TextStyle? style;
  final String? labelText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool? isReadOnly;
  final bool? hasSuffixIcon;

  final TextStyle? labelStyle;
  final bool? isRequiredField;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;

  const CustomTextFormField({
    super.key,
    this.errorText,
    this.isReadOnly = false,
    this.labelText,
    this.textEditingController,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength,
    this.style,
    this.labelStyle,
    this.isRequiredField = true,
    this.inputFormatters,
    this.hasSuffixIcon = false,
    this.onTap,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
              text: '$labelText',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontStyle: FontStyle.normal,
                  fontFamily: BaseStrings.montserrat,
                  color: BaseColors.primaryColor,
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              children: [
                TextSpan(
                    text: isRequiredField == true ? ' *' : "",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.normal,
                          color: Colors.red,
                          letterSpacing: 0.1,
                          fontSize: 15,
                        ))
              ]),
        ),
        5.toVSB,
        TextFormField(
          onTap: onTap,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          controller: textEditingController,
          maxLength: maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: isReadOnly! ? isReadOnly! : false,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontSize: 14,
            height: 1.8,
            fontWeight: FontWeight.w400,
            fontFamily: BaseStrings.montserrat,
          ),
          decoration: InputDecoration(
            hintText: hintText!,
            hintStyle: const TextStyle(
              fontSize: 14,
              height: 2,
              fontWeight: FontWeight.w400,
              color: BaseColors.textGreyColor,
              fontFamily: BaseStrings.montserrat,
            ),
            suffixIconConstraints:
                const BoxConstraints(minWidth: 25, maxHeight: 20),
            suffixIcon: hasSuffixIcon!
                ? const Icon(Icons.arrow_drop_down_outlined)
                : null,
            counterText: "",
            // errorText: '',
            errorStyle: const TextStyle(
              color: Colors.transparent,
              fontSize: 0,
              fontFamily: BaseStrings.montserrat,
              height: 2,
            ),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(width: 0.5, color: BaseColors.borderGreyColor),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(width: 0.5, color: BaseColors.borderGreyColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
            ),
          ),
          validator: validator,
        ),
        10.toVSB,
      ],
    );
  }
}
