import 'package:flutter/material.dart';
import 'package:jobsgo/component/job_card.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/services/job_service.dart';

class ListJobMatch extends StatefulWidget {
  const ListJobMatch({super.key, this.keyword = ""});
  final String keyword;

  @override
  State<ListJobMatch> createState() => _ListJobMatchState();
}

class _ListJobMatchState extends State<ListJobMatch> {
  bool isLoaded = false;
  List<Job> jobs = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var tempData = await JobService().findJobByKeyWord(widget.keyword);
    setState(() {
      jobs = tempData;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Container(
            padding: const EdgeInsets.all(25),
            child: listJob(),
          )
        : const CircularProgressIndicator();
  }

  Widget listJob() {
    return ListView.builder(
      itemCount: jobs.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) => JobCard(job: jobs.elementAt(index)),
    );
  }
}
