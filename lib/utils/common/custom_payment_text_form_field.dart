import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../base_constants/base_extensions.dart';
import '../base_constants/text_style.dart';

class CustomPaymentTextFormField extends StatelessWidget {
  final String? errorText;
  final String? hintText;
  final TextStyle? style;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? maxLength;
  final String? prefixIcon;
  final bool? obscureText;
  final bool? hasPrefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? hasSuffixIcon;
  final bool? isReadOnly;
  final bool? showErrorText;
  final TextStyle? labelStyle;
  final bool? isRequiredField;
  final String? labelText;
  final void Function()? onTap;

  const CustomPaymentTextFormField({
    super.key,
    this.errorText,
    this.textEditingController,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.maxLength,
    this.style,
    this.prefixIcon,
    this.hintText,
    this.obscureText = false,
    this.hasPrefixIcon = true,
    this.showErrorText = true,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.hasSuffixIcon = false,
    this.isReadOnly = false,
    this.labelStyle,
    this.isRequiredField = false,
    this.labelText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isRequiredField == true
            ? Column(
                children: [
                  RichText(
                    text: TextSpan(
                        text: '$labelText',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: BaseColors.searchTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        children: [
                          TextSpan(
                              text: isRequiredField == true ? ' *' : "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontStyle: FontStyle.normal,
                                    color: BaseColors.searchTextColor,
                                    letterSpacing: 0.1,
                                    fontSize: 13,
                                  ))
                        ]),
                  ),
                  5.toVSB,
                ],
              )
            : Container(),
        TextFormField(
          onTap: onTap,
          textInputAction: textInputAction,
          controller: textEditingController,
          maxLength: maxLength,
          obscureText: obscureText!,
          inputFormatters: inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: isReadOnly! ? isReadOnly! : false,
          maxLines: 1,
          keyboardType: keyboardType,
          textAlignVertical: TextAlignVertical.center,
          style: BaseTextStyles.formFieldText,
          decoration: InputDecoration(
            hintText: hintText!,
            hintStyle: BaseTextStyles.formHintText,
            suffixIconConstraints:
                const BoxConstraints(minWidth: 25, maxHeight: 20),
            suffixIcon: hasSuffixIcon!
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      BaseAssets.dropdownIcon,
                    ),
                  )
                : null,
            prefixIcon: hasPrefixIcon == true
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      prefixIcon ?? '',
                      width: size.width * 0.005,
                      fit: BoxFit.fill,
                    ),
                  )
                : null,
            errorMaxLines: 2,
            counterText: "",
            errorStyle: showErrorText!
                ? BaseTextStyles.errorText
                : const TextStyle(
                    color: Colors.transparent,
                    fontSize: 0,
                  ),
            isDense: true,
            filled: true,
            fillColor: BaseColors.textFieldBackgroundColor,
            contentPadding: EdgeInsets.symmetric(
                vertical: hasPrefixIcon == true ? 0.0 : 6.0, horizontal: 10.0),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  width: 0.5, color: BaseColors.textFieldBackgroundColor),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  width: 0.5, color: BaseColors.textFieldBackgroundColor),
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
