import 'package:flutter/material.dart';
import 'package:jobsgo/component/button_image.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/screens/JobDetail/job_detail.dart';
import 'package:jobsgo/themes/styles.dart';

class JobCard extends StatefulWidget {
  const JobCard({super.key, required this.job});

  final Job job;

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => JobDetail(job: widget.job),
        ),
      ),
      child: Container(
          height: 140,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColor.gray, width: 0.8, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ButtonImage(
                          urlImage: widget.job.authorAvatar,
                          goto: JobDetail(job: widget.job),
                          isNetWorkImage: true,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.job.authorName,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.job.title,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: widget.job.bookmark
                        ? Icon(
                            Icons.favorite,
                            color: AppColor.red,
                          )
                        : Icon(
                            Icons.favorite,
                            color: AppColor.gray,
                          ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColor.gray,
                    size: 18,
                  ),
                  Text(
                    " ${widget.job.authorAddress}",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColor.gray),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: AppColor.gray,
                    size: 18,
                  ),
                  Text(
                    " \$${widget.job.salary} /",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blue),
                  ),
                  Text(
                    "Month",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.blue,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
