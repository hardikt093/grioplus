import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grio_plus/models/ResetPassword/reset_password.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/common/common_auth_title_description.dart';
import '../../../utils/common/common_grio_logo.dart';
import '../../../utils/common/common_snackbar.dart';
import '../../../utils/widgets/button_widget.dart';
import '../../../utils/widgets/custom_rich_text_widget.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../LogIn/login_screen.dart';
import 'set_password_components/set_password_form_fields.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final setPasswordFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
        onPopInvoked: (didPop) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: BaseColors.authBlackColor,
              leading: InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: BaseColors.white,
                ),
              )),
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, AuthState state) {
              if (state is ResetPasswordLoadedState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showSnackBar(context, BaseStrings.emailSentSuccessful,
                      isError: false);
                  Navigator.pop(context);
                });
              }
              return Stack(
                children: [
                  Container(
                    color: BaseColors.authBlackColor,
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            110.toVSB,
                            GrioLogo(
                              height: size.height * 0.05,
                            ),
                            30.toVSB,
                            const CommonAuthTitleDescription(
                              greetingText: BaseStrings.setYour,
                              title: BaseStrings.password,
                            ),
                            30.toVSB,
                            SetPasswordFormFields(
                              setPasswordFormKey: setPasswordFormKey,
                              emailController: emailController,
                            ),
                            10.toVSB,
                            CustomFormButton(
                              backgroundColor: BaseColors.secondaryYellowColor,
                              buttonText: BaseStrings.resetPassword,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                setPasswordButton(context);
                              },
                              textColor: BaseColors.white,
                            ),
                            20.toVSB,
                            CustomRichText(
                              boldText: BaseStrings.logIn,
                              text: BaseStrings.backTo,
                              onTap: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                },
                            )
                          ],
                        ),
                      ),
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
        ));
  }

  void setPasswordButton(BuildContext context) {
    if (setPasswordFormKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(ResetPasswordRequest(
          ResetPasswordModel(email: emailController.text)));
    }
  }
}
