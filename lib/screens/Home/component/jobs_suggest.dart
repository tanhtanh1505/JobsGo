import 'package:flutter/material.dart';
import 'package:jobsgo/component/job_card.dart';
import 'package:jobsgo/themes/styles.dart';

class JobsSuggest extends StatefulWidget {
  const JobsSuggest({super.key});

  @override
  State<JobsSuggest> createState() => _JobsSuggestState();
}

class _JobsSuggestState extends State<JobsSuggest> {
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
                JobCard(
                    logo: 'assets/images/freelance.png',
                    company: "Twitter",
                    role: "Remote UI/UX Designer",
                    location: "Jakata-Indonesia",
                    salary: "500-1k",
                    postedIn: "12",
                    marked: false),
                JobCard(
                    logo: 'assets/images/freelance.png',
                    company: "Twitter",
                    role: "Remote UI/UX Designer",
                    location: "Jakata-Indonesia",
                    salary: "500-1k",
                    postedIn: "12",
                    marked: true),
              ],
            ),
          )
        ],
      ),
    );
  }
}
