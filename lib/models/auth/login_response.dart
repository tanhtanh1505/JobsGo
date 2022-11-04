import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

// String loginResponseModelToJson(LoginResponseModel data) =>
//     json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.id,
    required this.username,
    required this.name,
    required this.avatar,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.accessToken,
  });

  String id;
  String username;
  String name;
  String avatar;
  String email;
  String phone;
  DateTime createdAt;
  String accessToken;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        avatar: json["avatar"],
        email: json["email"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["create_time"]),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "avatar": avatar,
        "email": email,
        "phone": phone,
        "create_time": createdAt.toIso8601String(),
        "accessToken": accessToken,
      };
}
