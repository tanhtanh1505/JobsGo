import 'dart:convert';

RegisterRequestModel registerRequestModelFromJson(String str) =>
    RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) =>
    json.encode(data.toJson());

class RegisterRequestModel {
  RegisterRequestModel({
    required this.username,
    required this.name,
    required this.avatar,
    required this.email,
    required this.phone,
    required this.password,
  });

  String username;
  String name;
  String avatar;
  String email;
  String phone;
  String password;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        username: json["username"],
        name: json["name"],
        avatar: json["avatar"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "avatar": avatar,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
