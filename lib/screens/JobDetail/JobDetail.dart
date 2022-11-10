import 'package:flutter/material.dart';
import 'package:jobsgo/screens/JobDetail/component/Content.dart';
import 'package:jobsgo/screens/JobDetail/component/JDAppBar.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        iconTheme: const IconThemeData(color: Color(0xffA9A9A9), size: 32),
        title: const JDAppBar(title: "Job Detail"),
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0.0,
      ),

      body: const Content(),

    );
  }
}
