import 'package:flutter/material.dart';
import 'package:jobsgo/component/job_card.dart';
import 'package:jobsgo/component/search_bar.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/services/job_service.dart';

class ContentSavedJobs extends StatefulWidget {
  const ContentSavedJobs({super.key});

  @override
  State<ContentSavedJobs> createState() => _ContentSavedJobsState();
}

class _ContentSavedJobsState extends State<ContentSavedJobs> {
  List<JobModel> jobs = [];
  bool isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    List<JobModel> temp = await JobService().listMarkedJob();
    if (temp.isNotEmpty) {
      setState(() {
        isLoaded = true;
        jobs = temp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: SearchBar(text: "Search"),
        ),
        Expanded(child: buildData(context))
      ],
    );
  }

  Widget buildData(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (BuildContext context, int index) {
          return JobCard(job: jobs[index]);
        },
      ),
    );
  }
}
