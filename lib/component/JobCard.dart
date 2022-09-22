import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jobsgo/component/ButtonImage.dart';
import '../helper/ColorHelper.dart';

class JobCard extends StatefulWidget {
  const JobCard(
      {super.key,
      required this.logo,
      required this.company,
      required this.role,
      required this.location,
      required this.salary,
      required this.postedIn,
      required this.marked});

  final String logo;
  final String company;
  final String role;
  final String location;
  final String salary;
  final String postedIn;
  final bool marked;

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 152,
        padding: EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 189, 189, 189),
              width: 1,
              style: BorderStyle.solid),
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
                    ButtonImage(urlImage: widget.logo),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.company),
                        Text(widget.role),
                      ],
                    ),
                  ],
                ),
                widget.marked
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Colors.black,
                      )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: ColorHelper.gray(),
                  size: 18,
                ),
                Text(
                  widget.location,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: ColorHelper.gray()),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.monetization_on,
                  color: ColorHelper.gray(),
                  size: 18,
                ),
                Text(
                  "\$ ${widget.salary} /",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorHelper.blue()),
                ),
                Text(
                  "Month",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: ColorHelper.blue(),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
