import 'package:flutter/material.dart';
import 'package:jobsgo/component/ListJob.dart';
import 'package:jobsgo/models/post.dart';

import '../component/TitleText.dart';

class SavedJobs extends StatelessWidget {
  SavedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ListJob(),
    );
  }
}
