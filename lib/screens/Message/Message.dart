import 'package:flutter/material.dart';
import 'package:jobsgo/component/ChatArea.dart';
import 'package:jobsgo/screens/Profile/conponent/Username.dart';

import '../../component/TitleText.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: ListView(children: [ChatArea()]),
    );
  }
}
