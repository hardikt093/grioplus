import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../../models/SignOut/signout_request_model.dart';
import '../../../../models/device_info_model.dart';
import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/base_keys.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/common_snackbar.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../../helper/shared_data.dart';
import '../../LogIn/login_screen.dart';

class FloatingLogOutWidget extends StatefulWidget {
  const FloatingLogOutWidget({super.key});

  @override
  State<FloatingLogOutWidget> createState() => _FloatingLogOutWidgetState();
}

class _FloatingLogOutWidgetState extends State<FloatingLogOutWidget> {
  SharedData sharedData = SharedData();
  DeviceInfo? info;
  String? token;
  String? refreshToken;

  @override
  void initState() {
    context.read<AuthBloc>().add(DeviceInfoRequest(
          DeviceInfo(),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is SignOutLoadedState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackBar(context, BaseStrings.signOutSuccessful,
                isError: false);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
            sharedData.saveIsLogin(BaseKeys.isLogin, false);
            sharedData.clearData();
          });
        } else if (state is AuthErrorState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackBar(context, state.props.first.toString(), isError: true);
          });
        }
        return InkWell(
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          onTap: () async {
            deviceInfo();
            token = await sharedData.readToken(BaseKeys.token);
            refreshToken =
                await sharedData.readRefreshToken(BaseKeys.refreshToken);
            signOutButton();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Divider(
                  thickness: 1,
                  color: BaseColors.blackBorders,
                ),
                3.toVSB,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      BaseAssets.logoutIcon,
                      width: 20,
                      height: 20,
                    ),
                    8.toHSB,
                    const TextView(
                      BaseStrings.logOut,
                        textStyle: BaseTextStyles.logOutText
                    ),
                  ],
                ),
                11.toVSB,
              ],
            ),
          ),
        );
      },
    );
  }

  void signOutButton() async {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequest(SignOutRequestModel(
      refreshToken: refreshToken,
      deviceInfo: info,
    )));
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
