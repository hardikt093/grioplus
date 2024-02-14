import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grio_plus/services/custom_exception.dart';
import 'package:grio_plus/view/helper/shared_data.dart';
import 'package:http/http.dart' as http;
import '../bloc/auth_bloc/auth_bloc.dart';
import '../models/RefreshTokenModel/refresh_token_model.dart';
import '../utils/base_constants/base_keys.dart';
import '../utils/base_constants/base_strings.dart';
import '../utils/common/common_context.dart';

class ApiProvider {
  Uri? uri;
  SharedData sharedData = SharedData();

  Future<dynamic> postWithoutToken(String url, var body) async {
    dynamic responseJson;
    try {
      uri = Uri.parse(BaseStrings.baseUrl + url);
      final response = await http.post(uri!,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: body);

      responseJson = _response(response);
      log("Res : $responseJson");
    } on SocketException {
      throw BadRequestException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postWithToken(String url, var body) async {
    dynamic responseJson;
    try {
      String token = await sharedData.readToken(BaseKeys.token);
      uri = Uri.parse(BaseStrings.baseUrl + url);
      final response = await http.post(uri!,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            "Authorization": "Bearer $token",
            'accept': '*/*'
          },
          body: body);
      responseJson = _response(response);
      debugPrint('Res: $responseJson');
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithoutToken(String url, String parameter) async {
    dynamic responseJson;
    try {
      debugPrint(parameter);

      uri = Uri.parse(BaseStrings.baseUrl + url + parameter);

      final response = await http.get(uri!, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });
      responseJson = _response(response);
      log("Res : $responseJson");
    } on SocketException {
      throw NoInternetException(BaseStrings.noInternet);
    }
    return responseJson;
  }
  Future<dynamic> getWithToken(String url, String parameter) async {
    dynamic responseJson;
    try {
      String token = await sharedData.readToken(BaseKeys.token);

      uri = Uri.parse(BaseStrings.baseUrl + url + parameter);
      final response = await http.post(uri!,
          headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "Authorization": "Bearer $token",
          'accept': '*/*'
          },);
      responseJson = _response(response);
    } on SocketException {
      throw NoInternetException(BaseStrings.noInternet);
    }
    return responseJson;
  }
  /// response handled with status code
  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 204:
        return "Success";
      case 412:
      case 400:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];
        throw BadRequestException(msg);
      case 401:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];
        if (msg == "Invalid Credential") {
          throw BadRequestException(msg);
        } else {
          check(msg);
        }
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];
        throw BadRequestException(msg);
      case 409:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];
        throw NoInternetException(msg);
      case 500:
        var responseJson = json.decode(response.body.toString());
        var error = responseJson["errors"] ?? "";
        var msg = "";
        if (error != "") {
          msg = error["message"] ?? "";
        }
        throw BadRequestException(msg);

      default:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];
        throw NoInternetException(msg);
    }
  }
/// check the refresh token
  void check(msg) async {
    String tempToken = await sharedData.readRefreshToken(BaseKeys.refreshToken);
    BlocProvider.of<AuthBloc>(GlobalContext.navigatorKey.currentContext!)
        .add(RefreshTokenRequest(RefreshTokenModel(token: tempToken)));
    throw NoInternetException(msg);
  }
}
