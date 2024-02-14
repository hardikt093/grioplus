import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base_constants/base_colors.dart';
import '../base_constants/base_extensions.dart';
import '../base_constants/text_style.dart';

class CustomAuthTextFormField extends StatefulWidget {
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
  final bool? hasObscureIcon;
  final bool? isReadOnly;
  final bool? showErrorText;
  final TextStyle? labelStyle;
  final bool? isRequiredField;
  final String? labelText;
  final void Function()? onTap;
  final bool? isPassword;

  const CustomAuthTextFormField({
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
    this.hasObscureIcon = false,
    this.isReadOnly = false,
    this.labelStyle,
    this.isRequiredField = false,
    this.isPassword = false,
    this.labelText,
    this.onTap,
  });

  @override
  State<CustomAuthTextFormField> createState() =>
      _CustomAuthTextFormFieldState();
}

class _CustomAuthTextFormFieldState extends State<CustomAuthTextFormField> {
  bool? isPassToggle = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isRequiredField == true
            ? Column(
                children: [
                  RichText(
                    text: TextSpan(
                        text: '${widget.labelText}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: BaseColors.searchTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        children: [
                          TextSpan(
                              text: widget.isRequiredField == true ? ' *' : "",
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
          onTap: widget.onTap,
          textInputAction: widget.textInputAction,
          controller: widget.textEditingController,
          maxLength: widget.maxLength,
          obscureText: widget.isPassword! ? !isPassToggle! : false,
          inputFormatters: widget.inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: widget.isReadOnly! ? widget.isReadOnly! : false,
          maxLines: 1,
          keyboardType: widget.keyboardType,
          textAlignVertical: TextAlignVertical.center,
          style: BaseTextStyles.formFieldText,
          decoration: InputDecoration(
            hintText: widget.hintText!,
            hintStyle: BaseTextStyles.formHintText,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 25,
            ),
            suffixIcon: widget.isPassword!
                ? IconButton(
                    icon: Icon(
                      !isPassToggle!
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: BaseColors.authHintColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isPassToggle = !isPassToggle!;
                      });
                    },
                  )
                : null,
            prefixIcon: widget.hasPrefixIcon == true
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      widget.prefixIcon ?? '',
                      width: size.width * 0.005,
                      fit: BoxFit.fill,
                    ),
                  )
                : null,
            errorMaxLines: 2,
            counterText: "",
            errorStyle: widget.showErrorText!
                ? BaseTextStyles.errorText
                : const TextStyle(
                    color: Colors.transparent,
                    fontSize: 0,
                  ),
            isDense: true,
            filled: true,
            fillColor: BaseColors.textFieldBackgroundColor,
            contentPadding: EdgeInsets.symmetric(
                vertical: widget.hasPrefixIcon == true ? 0.0 : 6.0,
                horizontal: 10.0),
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
          validator: widget.validator,
        ),
        10.toVSB,
      ],
    );
  }
}
