import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../new_csc_picker.dart';
import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/custom_payment_text_form_field.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../../helper/validators.dart';

class PlanFormFields extends StatefulWidget {
  final GlobalKey? planFormKey;
  final String? countryValue;
  final String? stateValue;
  final String? cityValue;

  const PlanFormFields({
    super.key,
    required this.planFormKey,
    this.countryValue = "",
    this.stateValue = "",
    this.cityValue = "",
  });

  @override
  State<PlanFormFields> createState() => PlanFormFieldsState();
}

class PlanFormFieldsState extends State<PlanFormFields> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final postCodeController = TextEditingController();
  final countryController = TextEditingController();

  String initialCountry = 'AU';
  PhoneNumber number = PhoneNumber(isoCode: 'AU');

  String? address = "";
  final validators = Validators();

  String? countryValue1;
  String? stateValue1;
  String? cityValue1;

  @override
  void initState() {
    setState(() {
      countryValue1 = widget.countryValue;
      stateValue1 = widget.stateValue;
      cityValue1 = widget.cityValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.planFormKey,
      child: Column(
        children: [
          5.toVSB,
          const Align(
            alignment: Alignment.centerLeft,
            child: TextView(
              BaseStrings.billingAddress,
              textStyle: BaseTextStyles.billingText,
            ),
          ),
          10.toVSB,
          CustomPaymentTextFormField(
            hintText: BaseStrings.firstName,
            hasPrefixIcon: false,
            textInputAction: TextInputAction.next,
            textEditingController: firstNameController,
            showErrorText: false,
            validator: (value) => validators.validateFirstName(value!),
          ),
          CustomPaymentTextFormField(
            hintText: BaseStrings.lastName,
            hasPrefixIcon: false,
            textInputAction: TextInputAction.next,
            textEditingController: lastNameController,
            showErrorText: false,
            validator: (value) => validators.validateLastName(value!),
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
              textFieldController: mobileNumberController,
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
          CustomPaymentTextFormField(
            hintText: BaseStrings.email,
            hasPrefixIcon: false,
            textInputAction: TextInputAction.next,
            textEditingController: emailController,
            showErrorText: false,
            validator: (value) => validators.validateEmail(value!),
          ),
          CustomPaymentTextFormField(
            hintText: BaseStrings.address1,
            hasPrefixIcon: false,
            textInputAction: TextInputAction.next,
            textEditingController: address1Controller,
            showErrorText: false,
            validator: (value) => validators.validateAddress(value!),
          ),
          CustomPaymentTextFormField(
            hintText: BaseStrings.address2,
            hasPrefixIcon: false,
            textInputAction: TextInputAction.next,
            textEditingController: address2Controller,
            showErrorText: false,
          ),
          NewCSCPicker(
            showStates: true,
            showCities: true,

            ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
            flagState: CountryFlag.DISABLE,

            ///placeholders for dropdown search field
            countrySearchPlaceholder: BaseStrings.country,
            stateSearchPlaceholder: BaseStrings.state,
            citySearchPlaceholder: BaseStrings.city,

            ///labels for dropdown
            countryDropdownLabel: BaseStrings.country,
            stateDropdownLabel: BaseStrings.state,
            cityDropdownLabel: BaseStrings.city,

            ///Default Country
            ///defaultCountry: CscCountry.India,

            ///Country Filter [OPTIONAL PARAMETER]
            countryFilter: const [
              CscCountry.India,
              CscCountry.United_States,
              CscCountry.Canada
            ],

            ///Disable country dropdown (Note: use it with default country)
            //disableCountry: true,

            ///selected item style [OPTIONAL PARAMETER]
            selectedItemStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),

            ///DropdownDialog Heading style [OPTIONAL PARAMETER]
            dropdownHeadingStyle: const TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),

            ///DropdownDialog Item style [OPTIONAL PARAMETER]
            dropdownItemStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),

            ///Dialog box radius [OPTIONAL PARAMETER]
            dropdownDialogRadius: 10.0,

            ///Search bar radius [OPTIONAL PARAMETER]
            searchBarRadius: 10.0,

            ///triggers once country selected in dropdown
            onCountryChanged: (value) {
              setState(() {
                ///store value in country variable
                countryValue1 = value;
              });
            },

            ///triggers once state selected in dropdown
            onStateChanged: (value) {
              setState(() {
                ///store value in state variable
                stateValue1 = value;
              });
            },

            ///triggers once city selected in dropdown
            onCityChanged: (value) {
              setState(() {
                ///store value in city variable
                cityValue1 = value;
              });
            },

            ///Show only specific countries using country filter
            // countryFilter: ["United States", "Canada", "Mexico"],
          ),
          12.toVSB,
          CustomPaymentTextFormField(
            hintText: BaseStrings.postalCode,
            hasPrefixIcon: false,
            textInputAction: TextInputAction.next,
            textEditingController: postCodeController,
            showErrorText: false,
            validator: (value) => validators.validateZip(value!),
          ),
        ],
      ),
    );
  }
}
