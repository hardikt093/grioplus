part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class SignUpRequest extends AuthEvent {
  final SignUpRequestModel? data;

  SignUpRequest(this.data);

  @override
  List<Object?> get props => [data];
}

class DeviceInfoRequest extends AuthEvent {
  final DeviceInfo? data;

  DeviceInfoRequest(this.data);

  @override
  List<Object?> get props => [data];
}

class SignInRequest extends AuthEvent {
  final SignInRequestModel? data;

  SignInRequest(this.data);

  @override
  List<Object?> get props => [data];
}

class RefreshTokenRequest extends AuthEvent {
  final RefreshTokenModel? data;

  RefreshTokenRequest(this.data);

  @override
  List<Object?> get props => [data];
}

class SignOutRequest extends AuthEvent {
  final SignOutRequestModel? data;

  SignOutRequest(this.data);

  @override
  List<Object?> get props => [data];
}

class ChangePasswordRequest extends AuthEvent {
  final ChangePasswordModel? data;

  ChangePasswordRequest(this.data);

  @override
  List<Object?> get props => [data];
}

class ResetPasswordRequest extends AuthEvent {
  final ResetPasswordModel? data;

  ResetPasswordRequest(this.data);

  @override
  List<Object?> get props => [data];
}
