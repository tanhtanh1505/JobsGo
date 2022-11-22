import 'package:http/http.dart' as http;
import 'package:jobsgo/config.dart';
import 'package:jobsgo/helper/uri_helper.dart';
import 'package:jobsgo/models/user/user.dart';
import 'package:jobsgo/services/shared_service.dart';

class UserService {
  static var client = http.Client();

  static Future<UserModel> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.accessToken}',
    };

    var url = UriHelper.getUri(Config.profileAPI);

    var response = await client.get(url, headers: requestHeader);
    return userModelFromJson(response.body);
  }

  static Future<UserModel> getOtherProfile(String username) async {
    var url = UriHelper.getUri(Config.otherProfileApi + username);

    var response = await client.get(url);

    return userModelFromJson(response.body);
  }

  static Future<List<UserModel>> getListUserChated() async {
    List<UserModel> listUsers = [];
    var tanh = await getOtherProfile("tanhne");
    var test1 = await getOtherProfile("test1");
    var test2 = await getOtherProfile("test2");
    var test3 = await getOtherProfile("test3");

    listUsers.add(tanh);
    listUsers.add(test1);
    listUsers.add(test2);
    listUsers.add(test3);
    listUsers.add(tanh);
    listUsers.add(test1);
    listUsers.add(test2);
    listUsers.add(test3);
    listUsers.add(tanh);
    listUsers.add(test1);
    listUsers.add(test2);
    listUsers.add(test3);

    //test call api to get feel of waiting =))))))
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.accessToken}',
    };

    var url = UriHelper.getUri(Config.profileAPI);

    await client.get(url, headers: requestHeader);

    return listUsers;
  }
}
