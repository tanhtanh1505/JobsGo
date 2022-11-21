import 'dart:convert';

import 'package:jobsgo/config.dart';
import 'package:jobsgo/helper/uri_helper.dart';
import 'package:jobsgo/models/employer/employer.dart';
import 'package:http/http.dart' as http;

class EmployerService {
  static var client = http.Client();

  Future<EmployerModel?> getEmployer(String id) async {
    var url = UriHelper.getUri(Config.employer + id);

    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return EmployerModel.fromJson(jsonMap);
    }

    return null;
  }
}
