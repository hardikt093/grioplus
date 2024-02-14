import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../models/SignIn/signin_request_model.dart';
import '../../../models/device_info_model.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_keys.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/common/common_auth_title_description.dart';
import '../../../utils/common/common_grio_logo.dart';
import '../../../utils/common/common_snackbar.dart';
import '../../../utils/widgets/button_widget.dart';
import '../../../utils/widgets/custom_rich_text_widget.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/text_view.dart';
import '../../helper/shared_data.dart';
import '../Register/register_screen.dart';
import '../SetPassword/set_password.dart';
import '../dashboard/dashboard.dart';
import 'login_components/login_form_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final logInFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SharedData sharedData = SharedData();
  DeviceInfo? info;

  @override
  void initState() {
    sharedData.saveScreen(BaseKeys.isSignInScreen, true);
    context.read<AuthBloc>().add(DeviceInfoRequest(
          DeviceInfo(),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (BuildContext context, AuthState state) {
            if (state is SignInLoadedState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showSnackBar(context, BaseStrings.logInSuccessful,
                    isError: false);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                  (route) => false,
                );
                sharedData.saveScreen(BaseKeys.isSignInScreen, false);
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
                          130.toVSB,
                          GrioLogo(
                            height: size.height * 0.05,
                          ),
                          30.toVSB,
                          const CommonAuthTitleDescription(
                            title: BaseStrings.logIn,
                            greetingText: BaseStrings.welcomeBack,
                          ),
                          30.toVSB,
                          LoginFormFields(
                            logInFormKey: logInFormKey,
                            emailController: emailController,
                            passwordController: passwordController,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const SetPassword()),
                              );
                            },
                            child: const Align(
                                alignment: Alignment.centerRight,
                                child: TextView(
                                  BaseStrings.forgotPassword,
                                  color: BaseColors.white,
                                )),
                          ),
                          30.toVSB,
                          CustomFormButton(
                            backgroundColor: BaseColors.secondaryYellowColor,
                            buttonText: BaseStrings.logIn,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              loginButton(context);
                            },
                            textColor: BaseColors.white,
                          ),
                          20.toVSB,
                          CustomRichText(
                            boldText: BaseStrings.register,
                            text: BaseStrings.doNotHaveAccount,
                            onTap: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()),
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
      ),
    );
  }

  void loginButton(BuildContext context) async {
    deviceInfo();
    if (logInFormKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      BlocProvider.of<AuthBloc>(context).add(SignInRequest(SignInRequestModel(
        password: passwordController.text,
        email: emailController.text,
        deviceInfo: info,
      )));
    }
  }

  void deviceInfo() async {
    try {
      info = await sharedData.readDeviceInfo(BaseKeys.deviceInfo);
      log("${info!.properties.toString()}---------");
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
