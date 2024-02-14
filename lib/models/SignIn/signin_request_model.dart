import '../device_info_model.dart';

class SignInRequestModel {
  String? email;
  String? password;
  DeviceInfo? deviceInfo;

  SignInRequestModel({
    this.email,
    this.password,
    this.deviceInfo,
  });

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      SignInRequestModel(
        email: json["email"],
        password: json["password"],
        deviceInfo: json["deviceInfo"] == null
            ? null
            : DeviceInfo.fromJson(json["deviceInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "deviceInfo": deviceInfo?.toJson(),
      };
}
