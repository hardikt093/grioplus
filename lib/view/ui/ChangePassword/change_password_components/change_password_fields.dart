import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/custom_auth_text_form_field.dart';
import '../../../helper/validators.dart';

class ChangePasswordFormFields extends StatefulWidget {
  final GlobalKey? changePasswordFormKey;
  final TextEditingController? oldPasswordController;
  final TextEditingController? newPasswordController;
  final TextEditingController? confirmPasswordController;

  const ChangePasswordFormFields(
      {super.key,
      required this.changePasswordFormKey,
      this.oldPasswordController,
      this.newPasswordController,
      this.confirmPasswordController});

  @override
  State<ChangePasswordFormFields> createState() => SetPasswordFormFieldsState();
}

class SetPasswordFormFieldsState extends State<ChangePasswordFormFields> {
  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.changePasswordFormKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            hintText: BaseStrings.oldPassword,
            prefixIcon: BaseAssets.passwordIcon,
            textInputAction: TextInputAction.next,
            isPassword: true,
            textEditingController: widget.oldPasswordController,
            validator: (value) => validators.validatePassword(value!),
          ),
          CustomAuthTextFormField(
            hintText: BaseStrings.newPassword,
            prefixIcon: BaseAssets.passwordIcon,
            isPassword: true,
            textInputAction: TextInputAction.done,
            textEditingController: widget.newPasswordController,
            validator: (value) => validators.validatePassword(value!),
          ),
          CustomAuthTextFormField(
            hintText: BaseStrings.confirmPassword,
            prefixIcon: BaseAssets.passwordIcon,
            isPassword: true,
            textInputAction: TextInputAction.done,
            textEditingController: widget.confirmPasswordController,
            validator: (value) => validators.validateConfirmPassword(
                widget.newPasswordController!.text, value!),
          ),
        ],
      ),
    );
  }
}
