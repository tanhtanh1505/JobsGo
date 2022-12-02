import 'package:flutter/material.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/screens/JobDetail/component/content.dart';
import 'package:jobsgo/screens/JobDetail/component/footer_job_detail.dart';
import 'package:jobsgo/themes/styles.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({Key? key, required this.job}) : super(key: key);
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        iconTheme: IconThemeData(color: AppColor.black),
        title: Text(
          job.title,
          style: TextStyle(color: AppColor.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0.0,
      ),
      bottomSheet: FooterJobDetail(job: job),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Content(
          job: job,
        ),
      ),
    );
  }
}
