import 'package:flutter/material.dart';
import 'package:jobsgo/screens/JobDetail/component/Content.dart';
import 'package:jobsgo/screens/JobDetail/component/JDAppBar.dart';
import 'package:jobsgo/themes/styles.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        iconTheme: IconThemeData(color: Color(0xffA9A9A9), size: 32),
        title: JDAppBar(title: "Job Detail"),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),

      body: Content(),

    );
  }
}
