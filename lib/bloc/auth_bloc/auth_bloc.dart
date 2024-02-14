import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/ChangePassword/change_password_model.dart';
import '../../models/RefreshTokenModel/refresh_token_model.dart';
import '../../models/ResetPassword/reset_password.dart';
import '../../models/SignIn/signin_request_model.dart';
import '../../models/SignOut/signout_request_model.dart';
import '../../models/SignUp/signup_request_model.dart';
import '../../models/SignUp/signup_response_model.dart';
import '../../models/device_info_model.dart';
import '../../repository/auth_repository.dart';
import '../../utils/base_constants/base_keys.dart';
import '../../utils/base_constants/base_strings.dart';
import '../../utils/common/common_context.dart';
import '../../utils/common/common_snackbar.dart';
import '../../view/helper/shared_data.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  SharedData sharedData = SharedData();

  AuthBloc(this.authRepository) : super(AuthInitialState()) {
    /// Sign Up Request
    on<SignUpRequest>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final data = await authRepository.signUp(SignUpRequestModel(
            email: event.data?.email,
            deviceInfo: event.data?.deviceInfo,
            firstName: event.data?.firstName,
            lastName: event.data?.lastName,
            mobile: event.data?.mobile,
            password: event.data?.password));
        emit(SignUpLoadedState(data));
        await sharedData.saveUserCredentialsData(
            BaseKeys.userCredentialsData,
            SignInRequestModel(
                email: event.data?.email,
                deviceInfo: event.data?.deviceInfo,
                password: event.data?.password));
        await sharedData.readUserCredentialsData(BaseKeys.userCredentialsData);
        await sharedData.saveIsLogin(BaseKeys.isLogin, true);
      } catch (e) {
        emit(AuthErrorState(e.toString()));
        showSnackBar(GlobalContext.navigatorKey.currentContext!, e.toString(),
            isError: true);
      }
    });

    /// Sign In Request
    on<SignInRequest>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final data = await authRepository.signIn(SignInRequestModel(
            email: event.data?.email,
            deviceInfo: event.data?.deviceInfo,
            password: event.data?.password));
        emit(SignInLoadedState(data));
        sharedData.saveUserCredentialsData(
            BaseKeys.userCredentialsData,
            SignInRequestModel(
                email: event.data?.email,
                deviceInfo: event.data?.deviceInfo,
                password: event.data?.password));
        sharedData.readUserCredentialsData(BaseKeys.userCredentialsData);
        sharedData.saveIsLogin(BaseKeys.isLogin, true);
      } catch (e) {
        emit(AuthErrorState(e.toString()));
        showSnackBar(GlobalContext.navigatorKey.currentContext!, e.toString(),
            isError: true);
      }
    });

    /// Sign Out Request
    on<SignOutRequest>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final data = await authRepository.signOut(SignOutRequestModel(
            deviceInfo: event.data?.deviceInfo,
            refreshToken: event.data?.refreshToken));
        emit(SignOutLoadedState(data));
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    /// Change Password Request
    on<ChangePasswordRequest>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final data = await authRepository.changePassword(ChangePasswordModel(
          password: event.data?.password,
          oldPassword: event.data?.oldPassword,
          userId: event.data?.userId,
        ));
        emit(ChangePasswordLoadedState(data));
        showSnackBar(GlobalContext.navigatorKey.currentContext!,
            BaseStrings.passwordChangedSuccessful,
            isError: false);
        Navigator.pop(GlobalContext.navigatorKey.currentContext!);
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    /// Device Info Request
    on<DeviceInfoRequest>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final data = await authRepository.initPlatformState();
        emit(DeviceInfoLoadedState(DeviceInfo.fromJson(data)));
        await sharedData.saveDeviceInfo(
            BaseKeys.deviceInfo, DeviceInfo.fromJson(data));
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    /// Refresh Token Request
    on<RefreshTokenRequest>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final data = await authRepository
            .refreshToken(RefreshTokenModel(token: event.data?.token));
        emit(RefreshTokenLoadedState(data));
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    /// Reset Password Request
    on<ResetPasswordRequest>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final data = await authRepository
            .resetPassword(ResetPasswordModel(email: event.data?.email));
        emit(ResetPasswordLoadedState(data));
      } catch (e) {
        emit(AuthErrorState(e.toString()));
        showSnackBar(GlobalContext.navigatorKey.currentContext!, e.toString(),
            isError: true);
      }
    });
  }
}
