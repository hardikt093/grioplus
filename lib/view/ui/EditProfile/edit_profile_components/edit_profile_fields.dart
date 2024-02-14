import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/custom_payment_text_form_field.dart';
import '../../../helper/validators.dart';

class EditProfileFields extends StatefulWidget {
  final GlobalKey? editProfileFormKey;

  const EditProfileFields({super.key, required this.editProfileFormKey});

  @override
  State<EditProfileFields> createState() => EditProfileFieldsState();
}

class EditProfileFieldsState extends State<EditProfileFields> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String initialCountry = 'AU';
  PhoneNumber number = PhoneNumber(isoCode: 'AU');

  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: widget.editProfileFormKey,
      child: Column(
        children: [
          CustomPaymentTextFormField(
            hintText: BaseStrings.firstName,
            prefixIcon: BaseAssets.userIcon,
            textInputAction: TextInputAction.next,
            textEditingController: firstNameController,
            validator: (value) => validators.validateFirstName(value!),
          ),
          CustomPaymentTextFormField(
            hintText: BaseStrings.lastName,
            prefixIcon: BaseAssets.userIcon,
            textInputAction: TextInputAction.next,
            textEditingController: lastNameController,
            validator: (value) => validators.validateLastName(value!),
          ),
          CustomPaymentTextFormField(
            hintText: BaseStrings.email,
            prefixIcon: BaseAssets.emailIcon,
            textInputAction: TextInputAction.next,
            textEditingController: emailController,
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
                    width: size.width * 0.005,
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
              textFieldController: phoneController,
              formatInput: true,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                debugPrint('On Saved: $number');
              },
            ),
          ),
        ],
      ),
    );
  }
}
