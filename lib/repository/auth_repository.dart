import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:grio_plus/models/ResetPassword/reset_password.dart';
import 'package:grio_plus/models/SignIn/signin_request_model.dart';
import 'package:grio_plus/services/api_provider.dart';
import 'package:grio_plus/utils/base_constants/base_keys.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/ChangePassword/change_password_model.dart';
import '../models/RefreshTokenModel/refresh_token_model.dart';
import '../models/SignOut/signout_request_model.dart';
import '../models/SignUp/signup_request_model.dart';
import '../models/SignUp/signup_response_model.dart';
import '../models/UserInfo/user_model.dart';
import '../utils/base_constants/base_strings.dart';
import '../view/helper/shared_data.dart';

class AuthRepository {
  ApiProvider apiProvider = ApiProvider();
  String _platformVersion = 'Unknown';
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> deviceDataInfo = <String, dynamic>{};
  SharedData sharedData = SharedData();

  /// SignUp Repo

  Future<SignUpResponseModel> signUp(
      SignUpRequestModel signUpRequestModel) async {
    final response = await apiProvider.postWithoutToken(
        BaseStrings.signUpKey, jsonEncode(signUpRequestModel));
    await sharedData.saveToken(BaseKeys.token, response["data"]["accessToken"]);
    await sharedData.saveRefreshToken(
        BaseKeys.refreshToken, response["data"]["refreshToken"]);
    _decodedToken(response["data"]["accessToken"]);
    return SignUpResponseModel.fromJson(response);
  }

  /// SignIn Repo

  Future<SignUpResponseModel> signIn(
      SignInRequestModel signInRequestModel) async {
    final response = await apiProvider.postWithoutToken(
        BaseStrings.signInKey, jsonEncode(signInRequestModel));
    await sharedData.saveToken(BaseKeys.token, response["data"]["accessToken"]);
    await sharedData.saveRefreshToken(
        BaseKeys.refreshToken, response["data"]["refreshToken"]);
    _decodedToken(response["data"]["accessToken"]);
    return SignUpResponseModel.fromJson(response);
  }

  /// Refresh Token Repo

  Future<RefreshTokenModel> refreshToken(
      RefreshTokenModel refreshTokenModel) async {
    final response = await apiProvider.getWithoutToken(BaseStrings.refreshToken,
        await sharedData.readRefreshToken(BaseKeys.refreshToken));
    await sharedData.saveToken(BaseKeys.token, response["data"]["accessToken"]);
    return RefreshTokenModel.fromJson(response);
  }

  /// Reset Password Repo

  Future<ResetPasswordModel> resetPassword(
      ResetPasswordModel resetPasswordModel) async {
    final response = await apiProvider.getWithoutToken(
        BaseStrings.resetPasswordKey, jsonEncode(resetPasswordModel));
    return ResetPasswordModel.fromJson(response);
  }

  /// SignOut Repo

  Future<SignOutRequestModel> signOut(
      SignOutRequestModel signOutRequestModel) async {
    final response = await apiProvider.postWithToken(
        BaseStrings.signOutKey, jsonEncode(signOutRequestModel));
    return SignOutRequestModel.fromJson(response);
  }

  /// Change Password Repo

  Future<ChangePasswordModel> changePassword(
      ChangePasswordModel changePasswordModel) async {
    final response = await apiProvider.postWithToken(
        BaseStrings.changePasswordKey, jsonEncode(changePasswordModel));
    return ChangePasswordModel.fromJson(response);
  }

  /// Device Info Repo
  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      _platformVersion = androidInfo.id;
      return _platformVersion;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      _platformVersion = iosInfo.identifierForVendor.toString();
      return _platformVersion; // Unique ID for iOS devices
    } else {
      return "Unsupported platform"; // Handle other platforms if needed
    }
  }

  Future<Map<String, dynamic>> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        deviceData = switch (defaultTargetPlatform) {
          TargetPlatform.android =>
            _readAndroidBuildData(await deviceInfoPlugin.androidInfo),
          TargetPlatform.iOS =>
            _readIosDeviceInfo(await deviceInfoPlugin.iosInfo),
          TargetPlatform.linux =>
            _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo),
          TargetPlatform.windows =>
            _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo),
          TargetPlatform.macOS =>
            _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo),
          TargetPlatform.fuchsia => <String, dynamic>{
              'Error:': 'Fuchsia platform isn\'t supported'
            },
        };
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    return deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    getDeviceId();
    return <String, dynamic>{
      'version.release': build.version.release,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'id': _platformVersion,
      'model': build.model,
      'isPhysicalDevice': build.isPhysicalDevice,
      'serialNumber': build.serialNumber,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    getDeviceId();
    return <String, dynamic>{
      'id': _platformVersion,
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    getDeviceId();
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': _platformVersion,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    getDeviceId();
    return <String, dynamic>{
      'id': _platformVersion,
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    getDeviceId();
    return <String, dynamic>{
      'id': _platformVersion,
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'majorVersion': data.majorVersion,
      'minorVersion': data.minorVersion,
      'patchVersion': data.patchVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    getDeviceId();
    return <String, dynamic>{
      'id': _platformVersion,
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
      'userName': data.userName,
      'majorVersion': data.majorVersion,
      'minorVersion': data.minorVersion,
      'buildNumber': data.buildNumber,
      'platformId': data.platformId,
      'csdVersion': data.csdVersion,
      'servicePackMajor': data.servicePackMajor,
      'servicePackMinor': data.servicePackMinor,
      'suitMask': data.suitMask,
      'productType': data.productType,
      'reserved': data.reserved,
      'buildLab': data.buildLab,
      'buildLabEx': data.buildLabEx,
      'digitalProductId': data.digitalProductId,
      'displayVersion': data.displayVersion,
      'editionId': data.editionId,
      'installDate': data.installDate,
      'productId': data.productId,
      'productName': data.productName,
      'registeredOwner': data.registeredOwner,
      'releaseId': data.releaseId,
      'deviceId': data.deviceId,
    };
  }

  Map<String, dynamic> _decodedToken(String? token) {
    debugPrint("********${JwtDecoder.decode(token!)["id"]}");

    bool isTokenExpired = JwtDecoder.isExpired(token);
    if (isTokenExpired) {}
    sharedData.saveUserInfo(
        BaseKeys.userInfo,
        UserInfoModel(
            email: JwtDecoder.decode(token)["email"],
            firstName: JwtDecoder.decode(token)["firstName"],
            lastName: JwtDecoder.decode(token)["lastName"],
            profileImage: JwtDecoder.decode(token)["profileImage"],
            mobile: JwtDecoder.decode(token)["mobile"],
            id: JwtDecoder.decode(token)["id"]));
    return JwtDecoder.decode(token);
  }
}
