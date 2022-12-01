import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobsgo/config.dart';
import 'package:jobsgo/models/auth/login_response.dart';
import 'package:jobsgo/models/user/user.dart';
import 'package:jobsgo/screens/Auth/login.dart';

class SharedService {
  static LoginResponseModel? loginResponseModel;

  static Future<bool> isLoggedIn() async {
    if (kIsWeb) {
      if (loginResponseModel != null) return true;
      return false;
    }

    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");
    return isKeyExist || !Config.isProductMode;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    if (kIsWeb) {
      return loginResponseModel;
    }

    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");
    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return loginResponseModelFromJson(cacheData.syncData);
    }
    return null;
  }

  static Future<UserModel> userInfo() async {
    if (kIsWeb) {
      if (loginResponseModel != null) {
        return userModelFromJson(jsonEncode(loginResponseModel));
      }
      return exampleUser();
    }
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");
    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return userModelFromJson(cacheData.syncData);
    }

    return exampleUser();
  }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    if (kIsWeb) {
      loginResponseModel = model;
      return;
    }
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "login_details", syncData: jsonEncode(model.toJson()));
    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    if (kIsWeb) {
      loginResponseModel = null;
      return;
    }
    await APICacheManager().deleteCache("login_details");
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }
}
