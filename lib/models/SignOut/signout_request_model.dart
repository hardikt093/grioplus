import '../device_info_model.dart';

class SignOutRequestModel {
  final String? refreshToken;
  final DeviceInfo? deviceInfo;

  SignOutRequestModel({
    this.refreshToken,
    this.deviceInfo,
  });

  factory SignOutRequestModel.fromJson(Map<String, dynamic> json) =>
      SignOutRequestModel(
        refreshToken: json["refreshToken"],
        deviceInfo: json["deviceInfo"] == null
            ? null
            : DeviceInfo.fromJson(json["deviceInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
        "deviceInfo": deviceInfo?.toJson(),
      };
}
