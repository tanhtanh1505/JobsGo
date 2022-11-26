import 'package:flutter/material.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/screens/JobDetail/component/content.dart';
import 'package:jobsgo/screens/JobDetail/component/jd_appbar.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({Key? key, required this.job}) : super(key: key);
  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        iconTheme: const IconThemeData(color: Color(0xffA9A9A9), size: 32),
        title: const JDAppBar(title: "Job Detail"),
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Content(
          job: job,
        ),
      ),
    );
  }
}
