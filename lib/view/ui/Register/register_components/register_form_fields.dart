import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/custom_auth_text_form_field.dart';
import '../../../helper/validators.dart';

class RegisterFormFields extends StatefulWidget {
  final GlobalKey? registerFormKey;
  final TextEditingController? firstNameController;
  final TextEditingController passwordController;
  final TextEditingController lastNameController;

  final TextEditingController confirmPasswordController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const RegisterFormFields(
      {super.key,
      required this.registerFormKey,
      this.firstNameController,
      required this.passwordController,
      required this.lastNameController,
      required this.confirmPasswordController,
      required this.emailController,
      required this.phoneController});

  @override
  State<RegisterFormFields> createState() => RegisterFormFieldsState();
}

class RegisterFormFieldsState extends State<RegisterFormFields> {
  String initialCountry = 'AU';
  PhoneNumber number = PhoneNumber(isoCode: 'AU');

  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.registerFormKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            hintText: BaseStrings.enterFirstName,
            prefixIcon: BaseAssets.userIcon,
            textInputAction: TextInputAction.next,
            textEditingController: widget.firstNameController,
            validator: (value) => validators.validateFirstName(value!),
          ),
          CustomAuthTextFormField(
            hintText: BaseStrings.enterLastName,
            prefixIcon: BaseAssets.userIcon,
            textInputAction: TextInputAction.next,
            textEditingController: widget.lastNameController,
            validator: (value) => validators.validateLastName(value!),
          ),
          CustomAuthTextFormField(
            hintText: BaseStrings.email,
            prefixIcon: BaseAssets.emailIcon,
            textInputAction: TextInputAction.next,
            textEditingController: widget.emailController,
            validator: (value) => validators.validateEmail(value!),
          ),
          Theme(
            data: ThemeData(
              colorScheme: const ColorScheme.light(
                primary: BaseColors.redColor,
                onSurface: BaseColors.white,
              ),
              cardColor: BaseColors.textFieldBackgroundColor,
              dialogTheme: const DialogTheme(
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: BaseColors.textFieldBackgroundColor),
            ),
            child: InternationalPhoneNumberInput(
              // validator: (value) => validators.validatePhone(value!),
              textStyle: BaseTextStyles.formFieldText,
              inputDecoration: InputDecoration(
                hintText: BaseStrings.mobileNumber,
                hintStyle: BaseTextStyles.formHintText,
                suffixIconConstraints:
                    const BoxConstraints(minWidth: 25, maxHeight: 20),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    BaseAssets.mobileIcon,
                    width: 20,
                    fit: BoxFit.fill,
                  ),
                ),
                errorMaxLines: 2,
                counterText: "",
                errorStyle: BaseTextStyles.errorText,
                isDense: true,
                filled: true,
                fillColor: BaseColors.textFieldBackgroundColor,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
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
              onInputChanged: (PhoneNumber number) {
                debugPrint(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                debugPrint('$value');
              },
              selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                  useBottomSheetSafeArea: true,
                  trailingSpace: false,
                  setSelectorButtonAsPrefixIcon: true,
                  leadingPadding: 15),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              selectorTextStyle: BaseTextStyles.formHintBoldText,
              initialValue: number,
              textFieldController: widget.phoneController,
              formatInput: true,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                debugPrint('On Saved: $number');
              },
            ),
          ),
          10.toVSB,
          CustomAuthTextFormField(
            hintText: BaseStrings.password,
            prefixIcon: BaseAssets.passwordIcon,
            obscureText: true,
            textInputAction: TextInputAction.next,
            textEditingController: widget.passwordController,
            isPassword: true,
            validator: (value) => validators.validatePassword(value!),
          ),
          CustomAuthTextFormField(
            hintText: BaseStrings.confirmPassword,
            prefixIcon: BaseAssets.passwordIcon,
            obscureText: true,
            textInputAction: TextInputAction.done,
            textEditingController: widget.confirmPasswordController,
            isPassword: true,
            validator: (value) => validators.validateConfirmPassword(
                widget.passwordController.text, value!),
          ),
        ],
      ),
    );
  }
}
