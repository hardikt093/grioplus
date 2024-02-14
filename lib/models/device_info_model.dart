class DeviceInfo {
  Map<String, dynamic> properties = {};

  DeviceInfo();

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    DeviceInfo deviceInfo = DeviceInfo();
    deviceInfo.properties = (json);
    return deviceInfo;
  }

  Map<String, dynamic> toJson() {
    return properties;
  }
}
