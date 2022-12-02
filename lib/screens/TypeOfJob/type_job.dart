import 'package:flutter/material.dart';
import 'package:jobsgo/component/appbar_custom.dart';
import 'package:jobsgo/component/job_card.dart';
import 'package:jobsgo/component/search_bar.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/services/job_service.dart';

class TypeJob extends StatefulWidget {
  const TypeJob({super.key, this.title = ""});
  final String title;
  @override
  State<TypeJob> createState() => _TypeJobState();
}

class _TypeJobState extends State<TypeJob> {
  List<JobModel> listJobs = [];
  bool isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var temp = await JobService().getListSuggestJob();
    if (temp.isNotEmpty) {
      setState(() {
        listJobs = temp;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: AppbarCustom(
          title: widget.title,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 30, right: 30),
        children: <Widget>[
          const SearchBar(text: "Search"),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: 1000,
                      child: ListView.builder(
                        itemCount: listJobs.length,
                        itemBuilder: ((context, index) => JobCard(
                              job: listJobs.elementAt(index),
                            )),
                      ),
                    )),
        ],
      ),
    );
  }
}
