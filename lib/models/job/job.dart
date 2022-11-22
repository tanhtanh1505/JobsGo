import 'dart:convert';
import 'dart:ffi';

Job jobFromJson(String str) => Job.fromJson(json.decode(str));

class Job {
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

  Job(
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
      required this.imageUrl});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
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
        imageUrl: json["imageUrl"]);
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
      "imageUrl": imageUrl
    };
  }
}

Job exampleJob() => Job.fromJson({
      "id": "1751da34-18d7-4d34-b232-ce10821f6ba7",
      "title": "title",
      "description": "description",
      "requirements": "requirements",
      "tags": "tags",
      "author": "24ef3dbd-46d7-4cab-85c0-4cc407b51786",
      "startTime": "2022-11-01T00:00:00.000Z",
      "endTime": "2022-12-01T00:00:00.000Z",
      "createdAt": "2022-11-10T08:58:34.000Z",
      "salary": 1000,
      "typeOfWorking": "fulltime",
      "gender": "male",
      "positions": "staff",
      "slots": 10,
      "exp": "2 years",
      "benefits": "benefits",
      "imageUrl": "imageUrl"
    });
Job nullJob = Job.fromJson({
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
  "imageUrl": "x"
});
