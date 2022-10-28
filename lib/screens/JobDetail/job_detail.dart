import 'package:flutter/material.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/screens/JobDetail/component/bodyJobDetail.dart';
import 'package:jobsgo/services/job_service.dart';
import 'package:jobsgo/themes/styles.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({super.key, required this.jobId});

  final String jobId;

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  var isLoaded = true;
  // Job job = nullJob;

  @override
  void initState() {
    super.initState();

    //fetch data
    // getData();
  }

  getData() async {
    //get job from api by jobId below
    // job = await JobService().getJob(widget.jobId);
    // if (job != nullJob) {
    //   setState(() {
    //     isLoaded = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            "Job Detail",
            style: TextStyle(
                color: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.black),
          backgroundColor: Colors.transparent,
          // actions: [Icon(Icons.mark_as_unread)],
          elevation: 0.0,
        ),
        body: const Text("Job Detail"),
        // body: BodyJobDetail(job: job),
      ),
    );
  }
}
