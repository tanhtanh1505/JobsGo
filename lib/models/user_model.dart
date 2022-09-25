import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.avatar,
    required this.email,
    required this.phone,
    required this.createdAt,
  });

  String id;
  String username;
  String name;
  String avatar;
  String email;
  String phone;
  DateTime createdAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        avatar: json["avatar"],
        email: json["email"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "avatar": avatar,
        "email": email,
        "phone": phone,
        "createdAt": createdAt.toIso8601String(),
      };
}
