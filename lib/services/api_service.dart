import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jobsgo/config.dart';
import 'package:jobsgo/helper/uri_helper.dart';
import 'package:jobsgo/models/auth/login_request.dart';
import 'package:jobsgo/models/auth/login_response.dart';
import 'package:jobsgo/services/shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
    };

    var url = UriHelper.getUri(Config.loginAPI);

    var response = await client.post(url,
        headers: requestHeader, body: jsonEncode(model.toJson()));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      await SharedService.setLoginDetails(
          loginResponseModelFromJson(response.body));
      return true;
    } else {
      return false;
    }
  }
}
