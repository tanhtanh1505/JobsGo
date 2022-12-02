import 'package:jobsgo/helper/uri_helper.dart';
import 'package:jobsgo/services/shared_service.dart';
import 'package:http/http.dart' as http;

class CvService {
  static var client = http.Client();

  Future<String> genCv() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.accessToken}',
    };

    var url = UriHelper.getUri('/cv/random');
    var response = await client.post(url, headers: requestHeader);
    if (response.statusCode < 300) {
      return response.body;
    } else {
      return response.body;
    }
  }
}
