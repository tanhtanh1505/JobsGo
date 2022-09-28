import 'package:flutter/material.dart';
import 'package:jobsgo/component/AppbarCustom.dart';
import 'package:jobsgo/component/SearchBar.dart';
import 'package:jobsgo/screens/Message/component/ChatArea.dart';
import 'package:jobsgo/screens/Message/component/ListMessages.dart';
import 'package:jobsgo/screens/Profile/conponent/Username.dart';

import '../../component/TitleText.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppbarCustom(
          title: 'Message',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        // padding: const EdgeInsets.only(left: 30, right: 30),
        children: const <Widget>[
          SearchBar(text: "Search"),
          Expanded(child: ListMessages())
        ],
      ),
    );
  }
}
