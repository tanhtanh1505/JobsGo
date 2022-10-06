// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:jobsgo/component/AppbarCustom.dart';
import 'package:jobsgo/component/JobCard.dart';
import 'package:jobsgo/component/ListJob.dart';
import 'package:jobsgo/component/SearchBar.dart';


class SavedJobs extends StatelessWidget {
  const SavedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const AppbarCustom(
          title: 'Saved Job',
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
            child: Column(
              children: const [
                JobCard(
                    logo: 'assets/images/twitter.png',
                    company: "Twitter",
                    role: "Remote UI/UX Designer",
                    location: "Jakata-Indonesia",
                    salary: "500-1k",
                    postedIn: "12",
                    marked: true),
              ],
            ),
          ),
          const ListJob(),
        ],
      ),
    );
  }
}
