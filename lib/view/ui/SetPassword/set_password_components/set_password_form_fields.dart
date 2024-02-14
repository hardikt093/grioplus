import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/custom_auth_text_form_field.dart';
import '../../../helper/validators.dart';

class SetPasswordFormFields extends StatefulWidget {
  final GlobalKey? setPasswordFormKey;
  final TextEditingController? emailController;

  const SetPasswordFormFields(
      {super.key, required this.setPasswordFormKey, this.emailController});

  @override
  State<SetPasswordFormFields> createState() => SetPasswordFormFieldsState();
}

class SetPasswordFormFieldsState extends State<SetPasswordFormFields> {

  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.setPasswordFormKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            hintText: BaseStrings.email,
            prefixIcon: BaseAssets.emailIcon,
            textInputAction: TextInputAction.next,
            textEditingController: widget.emailController,
            validator: (value) => validators.validateEmail(value!),
          ),
        ],
      ),
    );
  }
}
