import 'dart:convert';

import 'package:jobsgo/models/user/user.dart';

EmployerModel employerModelFromJson(String str) =>
    EmployerModel.fromJson(json.decode(str));

// String EmployerModelToJson(EmployerModel data) => json.encode(data.toJson());

class EmployerModel extends UserModel {
  EmployerModel(
    id,
    username,
    name,
    avatar,
    email,
    phone,
    address,
    role,
    createdAt,
    this.about,
    this.wallpaper,
    this.size,
  ) : super(
            id: id,
            username: username,
            name: name,
            avatar: avatar,
            email: email,
            phone: phone,
            address: address,
            role: role,
            createdAt: createdAt);

  String about;
  String wallpaper;
  int size;

  factory EmployerModel.fromJson(Map<String, dynamic> json) => EmployerModel(
        json["id"],
        json["username"],
        json["name"],
        json["avatar"],
        json["email"],
        json["phone"],
        json["address"],
        json["role"],
        DateTime.parse(json["createdAt"]),
        json["about"],
        json["wallpaper"],
        json["size"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "avatar": avatar,
        "email": email,
        "phone": phone,
        "about": about,
        "wallpaper": wallpaper,
        "size": size,
        "createdAt": createdAt.toIso8601String(),
      };
}
