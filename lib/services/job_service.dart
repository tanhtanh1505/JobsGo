import 'package:jobsgo/models/job/job.dart';

class JobService {
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
}
