import 'package:flutter/material.dart';
import 'package:jobsgo/component/button_image.dart';
import 'package:jobsgo/models/application/application.dart';
import 'package:jobsgo/screens/JobDetail/job_detail.dart';
import 'package:jobsgo/themes/styles.dart';

class ApplicationCard extends StatefulWidget {
  const ApplicationCard({super.key, required this.application});

  final ApplicationModel application;

  @override
  State<ApplicationCard> createState() => _ApplicationCardState();
}

class _ApplicationCardState extends State<ApplicationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => JobDetail(job: widget.application.job),
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
                          urlImage: widget.application.job.authorAvatar,
                          goto: JobDetail(job: widget.application.job),
                          isNetWorkImage: true,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.application.job.authorName,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.38,
                            child: Text(
                              widget.application.job.title,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.gray,
                            width: 0.8,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        widget.application.status,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
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
                    " ${widget.application.job.authorAddress}",
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
                    " \$${widget.application.job.salary} /",
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
