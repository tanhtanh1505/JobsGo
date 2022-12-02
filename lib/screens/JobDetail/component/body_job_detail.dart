import 'package:flutter/material.dart';
import 'package:jobsgo/component/button_image.dart';
import 'package:jobsgo/models/job/job.dart';
import 'package:jobsgo/screens/Profile/profile.dart';

class BodyJobDetail extends StatefulWidget {
  const BodyJobDetail({super.key, required this.job});

  final JobModel job;

  @override
  State<BodyJobDetail> createState() => _BodyJobDetailState();
}

class _BodyJobDetailState extends State<BodyJobDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [titleJob()],
    );
  }

  Widget titleJob() {
    return Row(
      children: [
        ButtonImage(
          urlImage: widget.job.imageUrl,
          goto: const Profile(),
        ),
        Column(
          children: const [Text("data")],
        )
      ],
    );
  }
}
