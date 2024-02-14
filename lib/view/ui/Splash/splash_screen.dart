import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../models/device_info_model.dart';
import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_keys.dart';
import '../../helper/shared_data.dart';
import '../LogIn/login_screen.dart';
import '../dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SharedData sharedData = SharedData();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(DeviceInfoRequest(
      DeviceInfo(),
    ));
    Timer(const Duration(seconds: 3), () => checkIfAlreadyLogin());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: BaseColors.authBlackColor,
      child: Center(
        child: SizedBox(
          width: size.width * 0.6,
          height: size.height * 0.4,
          child: Image.asset(
            BaseAssets.flutterSplashGif,
          ),
        ),
      ),
    );
  }

  void checkIfAlreadyLogin() async {
    SharedData sharedData = SharedData();
    final isLogin = await sharedData.readIsLogin(BaseKeys.isLogin);
    debugPrint("isLogin $isLogin");

    if (isLogin == true) {
      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()));
      }
    } else {
      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    }
  }
}
