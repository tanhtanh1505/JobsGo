import 'package:flutter/material.dart';
import 'package:jobsgo/component/list_job.dart';

class SavedJobs extends StatelessWidget {
  const SavedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const ListJob(),
    );
  }
}