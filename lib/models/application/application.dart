import 'dart:convert';

import 'package:jobsgo/models/job/job.dart';

ApplicationModel applicationModelFromJson(String str) =>
    ApplicationModel.fromJson(json.decode(str));

String applicationModelToJson(ApplicationModel data) =>
    json.encode(data.toJson());

class ApplicationModel {
  ApplicationModel({
    required this.id,
    required this.jobseekerId,
    required this.jobId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.job,
  });

  String id;
  String jobseekerId;
  String jobId;
  String status;
  DateTime createdAt;
  DateTime? updatedAt;
  JobModel job;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      id: json["id"],
      jobseekerId: json["jobseekerId"],
      jobId: json["jobId"],
      status: json["status"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt:
          json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      job: JobModel.fromJson(json["job"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobseekerId": jobseekerId,
        "jobId": jobId,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "job": job.toJson(),
      };
}
