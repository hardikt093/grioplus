part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  final String? error;

  AuthErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class SignUpLoadedState extends AuthState {
  final SignUpResponseModel? data;

  SignUpLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class SignInLoadedState extends AuthState {
  final SignUpResponseModel? data;

  SignInLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class SignOutLoadedState extends AuthState {
  final SignOutRequestModel? data;

  SignOutLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class ChangePasswordLoadedState extends AuthState {
  final ChangePasswordModel? data;

  ChangePasswordLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class DeviceInfoLoadedState extends AuthState {
  final DeviceInfo? data;

  DeviceInfoLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class RefreshTokenLoadedState extends AuthState {
  final RefreshTokenModel? data;

  RefreshTokenLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class ResetPasswordLoadedState extends AuthState {
  final ResetPasswordModel? data;

  ResetPasswordLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}
