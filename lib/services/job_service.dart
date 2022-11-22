import 'dart:convert';

import 'package:jobsgo/config.dart';
import 'package:jobsgo/helper/uri_helper.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/services/shared_service.dart';
import 'package:http/http.dart' as http;

class JobService {
  static var client = http.Client();

  //future function get a job
  Future<Job> getJob(String id) async {
    //get job from api
    //return job
    return Job.fromJson({
      'id': 'id',
      'title': 'title',
      'company': 'company',
      'location': 'location',
      'salary': 'salary',
      'description': 'description',
      'requirements': 'requirements',
      'datePosted': 'datePosted',
      'dateClosed': 'dateClosed',
      'imageUrl': 'imageUrl',
    });
  }

  Future<List<Job>> getListSuggestJob() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.accessToken}',
    };

    var url = UriHelper.getUri('${Config.recommendJobAPI}2');

    var response = await client.get(url, headers: requestHeader);

    //for add job from response to list
    List<Job> listJobs = [];
    var jobJson = jsonDecode(response.body);
    for (var item in jobJson) {
      listJobs.add(Job.fromJson(item));
    }

    return listJobs;
  }
}
