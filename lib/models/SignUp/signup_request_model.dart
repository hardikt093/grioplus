import '../device_info_model.dart';

class SignUpRequestModel {
  final String? mobile;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final DeviceInfo? deviceInfo;

  SignUpRequestModel({
    this.mobile,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.deviceInfo,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      SignUpRequestModel(
        mobile: json["mobile"],
        email: json["email"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        deviceInfo: json["deviceInfo"] == null
            ? null
            : DeviceInfo.fromJson(json["deviceInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "deviceInfo": deviceInfo?.toJson(),
      };
}
