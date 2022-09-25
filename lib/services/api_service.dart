import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jobsgo/config.dart';
import 'package:jobsgo/models/login_request_model.dart';
import 'package:jobsgo/models/login_response_model.dart';
import 'package:jobsgo/models/register_request_model.dart';
import 'package:jobsgo/models/register_response_model.dart';
import 'package:jobsgo/models/user_model.dart';
import 'package:jobsgo/services/shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(url,
        headers: requestHeader, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
          loginResponseModelFromJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(url,
        headers: requestHeader, body: jsonEncode(model.toJson()));

    return registerResponseModelFromJson(response.body);
  }

  static Future<UserModel> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'token': 'Bearer ${loginDetails?.accessToken}',
    };

    var url = Uri.http(Config.apiURL, Config.profileAPI);

    var response = await client.get(url, headers: requestHeader);

    return userModelFromJson(response.body);
  }
}
