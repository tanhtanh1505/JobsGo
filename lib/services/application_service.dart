import 'dart:convert';

import 'package:jobsgo/helper/uri_helper.dart';
import 'package:jobsgo/models/application/application.dart';
import 'package:jobsgo/services/shared_service.dart';
import 'package:http/http.dart' as http;

class ApplicationService {
  static var client = http.Client();

  Future<List<ApplicationModel>> getListApplication() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.accessToken}',
    };

    var url = UriHelper.getUri('/application/mine');
    var response = await client.get(url, headers: requestHeader);

    List<ApplicationModel> listApplications = [];
    var applicationJson = jsonDecode(response.body);
    for (var item in applicationJson) {
      listApplications.add(ApplicationModel.fromJson(item));
    }

    return listApplications;
  }
}
