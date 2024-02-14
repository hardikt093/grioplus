import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/device_info_model.dart';
import '../../utils/base_constants/base_keys.dart';

class SharedData {
  ///Save and Read user Credentials
  saveUserCredentialsData(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(BaseKeys.userCredentialsData, json.encode(value));
  }

  readUserCredentialsData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(BaseKeys.userCredentialsData)!);
  }

  ///Save and Read User Info
  saveUserInfo(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(BaseKeys.userInfo, json.encode(value));
  }

  readUserInfo(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(BaseKeys.userInfo)!);
  }

  ///Save and Read if screen is Sign In
  saveScreen(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(BaseKeys.isSignInScreen, json.encode(value));
  }

  readScreen(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(BaseKeys.isSignInScreen)!);
  }

  ///Save and Read Token
  saveToken(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(BaseKeys.token, json.encode(value));
  }

  readToken(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(BaseKeys.token)!);
  }

  ///Save and Read Refresh Token
  saveRefreshToken(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(BaseKeys.refreshToken, json.encode(value));
  }

  readRefreshToken(String key) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint("hello${{json.decode(prefs.getString(BaseKeys.refreshToken)!)}}");
    debugPrint(json.decode(prefs.getString(BaseKeys.token)!));
    debugPrint("ho${{json.decode(prefs.getString(BaseKeys.token)!)}}");

    return json.decode(prefs.getString(BaseKeys.refreshToken)!);
  }

  ///Save and Read Login status
  saveIsLogin(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(BaseKeys.isLogin, value);
  }

  readIsLogin(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(BaseKeys.isLogin);
  }

  ///Save and Read Device Info
  saveDeviceInfo(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(BaseKeys.deviceInfo, jsonEncode(value));
  }

  readDeviceInfo(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return DeviceInfo.fromJson(
        json.decode(prefs.getString(BaseKeys.deviceInfo)!));
  }

  ///Clear Shared Data
  clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
