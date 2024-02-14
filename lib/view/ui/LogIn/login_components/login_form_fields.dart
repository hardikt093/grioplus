import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/custom_auth_text_form_field.dart';
import '../../../helper/validators.dart';

class LoginFormFields extends StatefulWidget {
  final GlobalKey? logInFormKey;
  final TextEditingController? emailController;

  final TextEditingController? passwordController;

  const LoginFormFields(
      {super.key,
      required this.logInFormKey,
      this.emailController,
      this.passwordController});

  @override
  State<LoginFormFields> createState() => LoginFormFieldsState();
}

class LoginFormFieldsState extends State<LoginFormFields> {
  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.logInFormKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            hintText: BaseStrings.email,
            prefixIcon: BaseAssets.emailIcon,
            textInputAction: TextInputAction.next,
            textEditingController: widget.emailController,
            validator: (value) => validators.validateEmail(value!),
          ),
          CustomAuthTextFormField(
            hintText: BaseStrings.password,
            prefixIcon: BaseAssets.passwordIcon,
            isPassword: true,
            textInputAction: TextInputAction.done,
            textEditingController: widget.passwordController,
            validator: (value) => validators.validatePassword(value!),
          ),
        ],
      ),
    );
  }
}
