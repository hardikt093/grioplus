import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../models/ChangePassword/change_password_model.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_keys.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/widgets/button_widget.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/text_view.dart';
import '../../helper/shared_data.dart';
import 'change_password_components/change_password_fields.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final changePasswordFormKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  SharedData sharedData = SharedData();
  int? usersId;

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomFormButton(
          backgroundColor: BaseColors.secondaryYellowColor,
          buttonText: BaseStrings.changePassword,
          onPressed: () {
            FocusScope.of(context).unfocus();
            updateProfileButton(context);
          },
          textColor: BaseColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: BaseColors.white,
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const TextView(
          BaseStrings.changePassword,
          textStyle: BaseTextStyles.appBarText,
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: TextView(
                            BaseStrings.changePasswordDescription,
                            textStyle: BaseTextStyles.screenDescriptionText,
                          ),
                        ),
                        20.toVSB,
                        ChangePasswordFormFields(
                          changePasswordFormKey: changePasswordFormKey,
                          confirmPasswordController: confirmPasswordController,
                          newPasswordController: newPasswordController,
                          oldPasswordController: oldPasswordController,
                        ),
                      ]),
                ),
              ),
              Visibility(
                visible: state is AuthLoadingState ? true : false,
                child: loadingWidget(context),
              )
            ],
          );
        },
      ),
    );
  }

  void updateProfileButton(BuildContext context) {
    if (changePasswordFormKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context)
          .add(ChangePasswordRequest(ChangePasswordModel(
        oldPassword: oldPasswordController.text,
        password: confirmPasswordController.text,
        userId: usersId,
      )));
    }
  }

  getUserId() async {
    dynamic userData = await sharedData.readUserInfo(BaseKeys.userInfo);
    usersId = userData["id"];
    debugPrint("cscsd$usersId");
  }
}
