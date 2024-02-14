import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../models/SignUp/signup_request_model.dart';
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
import '../../helper/shared_data.dart';
import '../LogIn/login_screen.dart';
import '../dashboard/dashboard.dart';
import 'register_components/register_form_fields.dart';
import 'register_components/register_terms_row.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  SharedData sharedData = SharedData();
  final bool isTermsAccepted = false;

  DeviceInfo? info;

  @override
  void initState() {
    context.read<AuthBloc>().add(DeviceInfoRequest(
          DeviceInfo(),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return blocListNewBody();
  }

  Widget blocListNewBody() {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
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
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                color: BaseColors.white,
              ),
            )),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (BuildContext context, AuthState state) {
            if (state is SignUpLoadedState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showSnackBar(context, BaseStrings.logInSuccessful,
                    isError: false);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()),
                    (Route<dynamic> route) => false);
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
                          10.toVSB,
                          GrioLogo(
                            height: size.height * 0.05,
                          ),
                          30.toVSB,
                          const CommonAuthTitleDescription(
                            title: BaseStrings.register,
                            greetingText: BaseStrings.welcomeToGrio,
                          ),
                          30.toVSB,
                          RegisterFormFields(
                            registerFormKey: registerFormKey,
                            firstNameController: firstNameController,
                            lastNameController: lastNameController,
                            passwordController: passwordController,
                            emailController: emailController,
                            phoneController: phoneController,
                            confirmPasswordController:
                                confirmPasswordController,
                          ),
                          const RegisterTermsRow(),
                          20.toVSB,
                          CustomFormButton(
                            backgroundColor: BaseColors.secondaryYellowColor,
                            buttonText: BaseStrings.createNewAccount,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              registerButton(context);
                            },
                            textColor: BaseColors.white,
                          ),
                          20.toVSB,
                          CustomRichText(
                            text: BaseStrings.alreadyHaveAnAccount,
                            boldText: BaseStrings.logIn,

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
      ),
    );
  }

  void registerButton(BuildContext context) {
    deviceInfo();
    if (registerFormKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(SignUpRequest(
        SignUpRequestModel(
            password: passwordController.text,
            mobile: phoneController.text,
            lastName: lastNameController.text,
            firstName: firstNameController.text,
            email: emailController.text,
            deviceInfo: DeviceInfo()),
      ));
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
