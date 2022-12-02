import 'package:flutter/material.dart';
import 'package:jobsgo/component/appbar_custom.dart';
import 'package:jobsgo/component/job_card.dart';
import 'package:jobsgo/component/search_bar.dart';

class Remote extends StatelessWidget {
  const Remote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const AppbarCustom(
          title: 'Remote',
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
                    location: "Jakarta, Indonesia",
                    salary: "500 - 1000",
                    postedIn: "12",
                    marked: true
                ),
                JobCard(
                    logo: 'assets/images/Pinterest.png',
                    company: "Pinterest",
                    role: "UI & UX Designer",
                    location: "San Francisco, USA",
                    salary: "10.000 - 20.000",
                    postedIn: "12",
                    marked: false,
                ),
                JobCard(
                    logo: 'assets/images/appsheet.png',
                    company: "AppSheet",
                    role: "IT Support",
                    location: "Ha Noi, Viet Nam",
                    salary: "1000 - 2000",
                    postedIn: "12",
                    marked: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
