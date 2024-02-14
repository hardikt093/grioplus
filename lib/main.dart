import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'repository/auth_repository.dart';
import 'utils/base_constants/base_colors.dart';
import 'utils/base_constants/base_strings.dart';
import 'utils/common/common_context.dart';
import 'view/ui/LogIn/login_screen.dart';
import 'view/ui/Splash/splash_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(milliseconds: 1))
      .then((value) => FlutterNativeSplash.remove());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(
              RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
            navigatorKey: GlobalContext.navigatorKey,
            color: BaseColors.primaryColor,
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: BaseStrings.montserrat,
                textSelectionTheme:
                    const TextSelectionThemeData(cursorColor: Colors.red),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    iconTheme: IconThemeData(color: BaseColors.white),
                    elevation: 0)),
            title: BaseStrings.appName,
            debugShowCheckedModeBanner: false,
            home: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthInitialState) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false,
                    );
                  }
                },
                child: const SplashScreen())),
      ),
    );
  }
}
