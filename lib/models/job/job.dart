import 'dart:convert';

JobModel jobModelFromJson(String str) => JobModel.fromJson(json.decode(str));

class JobModel {
  final String id;
  final String title;
  final String description;
  final String requirements;
  final String tags;
  final String author;
  final String startTime;
  final String endTime;
  final String createdAt;
  final int salary;
  final String typeOfWorking;
  final String gender;
  final String positions;
  final int slots;
  final String exp;
  final String benefits;
  final String imageUrl;
  final bool bookmark;
  final String authorName;
  final String authorAddress;
  final String authorEmail;
  final String authorPhone;
  final String authorAvatar;
  final String authorAbout;
  final int authorSize;

  JobModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.requirements,
      required this.tags,
      required this.author,
      required this.startTime,
      required this.endTime,
      required this.createdAt,
      required this.salary,
      required this.typeOfWorking,
      required this.gender,
      required this.positions,
      required this.slots,
      required this.exp,
      required this.benefits,
      required this.imageUrl,
      required this.bookmark,
      required this.authorName,
      required this.authorAddress,
      required this.authorEmail,
      required this.authorPhone,
      required this.authorAvatar,
      required this.authorAbout,
      required this.authorSize});

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        requirements: json["requirements"],
        tags: json["tags"],
        author: json["author"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        createdAt: json["createdAt"],
        salary: json["salary"],
        typeOfWorking: json["typeOfWorking"],
        gender: json["gender"],
        positions: json["positions"],
        slots: json["slots"],
        exp: json["exp"],
        benefits: json["benefits"],
        imageUrl: json["imageUrl"],
        bookmark: json["bookmark"],
        authorName: json["authorName"],
        authorAddress: json["authorAddress"],
        authorEmail: json["authorEmail"],
        authorPhone: json["authorPhone"],
        authorAvatar: json["authorAvatar"],
        authorAbout: json["authorAbout"],
        authorSize: json["authorSize"]);
  }

  //to json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "requirements": requirements,
      "tags": tags,
      "author": author,
      "startTime": startTime,
      "endTime": endTime,
      "createdAt": createdAt,
      "salary": salary,
      "typeOfWorking": typeOfWorking,
      "gender": gender,
      "positions": positions,
      "slots": slots,
      "exp": exp,
      "benefits": benefits,
      "imageUrl": imageUrl,
      "bookmark": bookmark,
      "authorName": authorName,
      "authorAddress": authorAddress,
      "authorEmail": authorEmail,
      "authorPhone": authorPhone,
      "authorAvatar": authorAvatar,
      "authorAbout": authorAbout,
      "authorSize": authorSize,
    };
  }
}

JobModel exampleJobModel() => JobModel.fromJson({
      "id": "id",
      "title": "title",
      "description": "description",
      "requirements": "requirements",
      "tags": "tags",
      "author": "author",
      "startTime": "startTime",
      "endTime": "endTime",
      "createdAt": "createdAt",
      "salary": "salary",
      "typeOfWorking": "typeOfWorking",
      "gender": "gender",
      "positions": "positions",
      "slots": "slots",
      "exp": "exp",
      "benefits": "benefits",
      "imageUrl": "imageUrl",
      "bookmark": "bookmark",
      "authorName": "authorName",
      "authorAddress": "authorAddress",
      "authorEmail": "authorEmail",
      "authorPhone": "authorPhone",
      "authorAvatar": "authorAvatar",
      "authorAbout": "authorAbout",
      "authorSize": "authorSize"
    });
JobModel nullJobModel = JobModel.fromJson({
  "id": "x",
  "title": "x",
  "description": "x",
  "requirements": "x",
  "tags": "x",
  "author": "x",
  "startTime": "x",
  "endTime": "x",
  "createdAt": "x",
  "salary": 0,
  "typeOfWorking": "x",
  "gender": "x",
  "positions": "x",
  "slots": 0,
  "exp": "x",
  "benefits": "x",
  "imageUrl": "x",
  "bookmark": false,
  "authorName": "x",
  "authorAddress": "x",
  "authorEmail": "x",
  "authorPhone": "x",
  "authorAvatar": "x",
  "authorAbout": "x",
  "authorSize": 0
});
