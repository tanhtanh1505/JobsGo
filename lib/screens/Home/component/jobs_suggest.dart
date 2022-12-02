import 'package:flutter/material.dart';
import 'package:jobsgo/component/job_card.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/services/job_service.dart';
import 'package:jobsgo/themes/styles.dart';
import 'package:logger/logger.dart';

class JobsSuggest extends StatefulWidget {
  const JobsSuggest({super.key});

  @override
  State<JobsSuggest> createState() => _JobsSuggestState();
}

class _JobsSuggestState extends State<JobsSuggest> {
  List<JobModel> listJob = [];
  bool isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    if (isLoading) {
      JobService().getListSuggestJob().then((value) {
        isLoading = false;
        setState(() {
          listJob = value;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New jobs",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                "See more",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColor.blue,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: listJobSuggest(),
          )
        ],
      ),
    );
  }

  //setstate
  Future<void> _refresh() async {
    setState(() {
      isLoading = true;
      getData();
    });
  }

  Widget listJobSuggest() {
    return isLoading
        ? const CircularProgressIndicator()
        : ListView.builder(
            itemCount: listJob.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return JobCard(
                job: listJob.elementAt(index),
                callBack: _refresh,
              );
            });
  }
}
